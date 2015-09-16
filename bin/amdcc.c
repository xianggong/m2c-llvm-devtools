#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <CL/cl.h>

unsigned char *read_buffer(const char *file_name, size_t *size_ptr) {
  FILE *f;
  unsigned char *buf;
  size_t size;

  /* Open file */
  f = fopen(file_name, "rb");

  if (!f)
    return NULL;

  /* Obtain file size */
  fseek(f, 0, SEEK_END);
  size = ftell(f);
  fseek(f, 0, SEEK_SET);

  /* Allocate and read buffer */
  buf = malloc(size + 1);
  fread(buf, 1, size, f);
  buf[size] = '\0';

  /* Return size of buffer */
  if (size_ptr)
    *size_ptr = size;

  /* Return buffer */
  return buf;
}

int main(int argc, char const *argv[]) {

  if (argc != 2) {
    printf("error: no kernel file\n");
    exit(-1);
  }

  /* Get platform */
  cl_platform_id platform;
  cl_uint num_platforms;
  cl_int ret = clGetPlatformIDs(1, &platform, &num_platforms);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clGetPlatformIDs' failed\n");
    exit(1);
  }

  printf("Number of platforms: %d\n", num_platforms);
  printf("platform=%p\n", platform);

  /* Get platform name */
  char platform_name[100];
  ret = clGetPlatformInfo(platform, CL_PLATFORM_NAME, sizeof(platform_name),
                          platform_name, NULL);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clGetPlatformInfo' failed\n");
    exit(1);
  }

  printf("platform.name='%s'\n\n", platform_name);

  /* Get device */
  cl_device_id device;
  cl_uint num_devices;
  ret = clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, &num_devices);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clGetDeviceIDs' failed\n");
    exit(1);
  }

  printf("Number of devices: %d\n", num_devices);
  printf("device=%p\n", device);

  /* Get device name */
  char device_name[100];
  ret = clGetDeviceInfo(device, CL_DEVICE_NAME, sizeof(device_name),
                        device_name, NULL);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clGetDeviceInfo' failed\n");
    exit(1);
  }

  printf("device.name='%s'\n", device_name);
  printf("\n");

  /* Create a Context Object */
  cl_context context;
  context = clCreateContext(NULL, 1, &device, NULL, NULL, &ret);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clCreateContext' failed\n");
    exit(1);
  }

  printf("context=%p\n", context);

  /* Create a Command Queue Object*/
  cl_command_queue command_queue;
  command_queue = clCreateCommandQueue(context, device, 0, &ret);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clCreateCommandQueue' failed\n");
    exit(1);
  }

  printf("command_queue=%p\n", command_queue);
  printf("\n");

  /* Program source */
  unsigned char *source_code;
  size_t source_length;

  /* Read program */
  source_code = read_buffer(argv[1], &source_length);

  /* Create a program */
  cl_program program;
  program = clCreateProgramWithSource(context, 1, (const char **)&source_code,
                                      &source_length, &ret);

  if (ret != CL_SUCCESS) {
    printf("error: call to 'clCreateProgramWithSource' failed\n");
    exit(1);
  }
  printf("program=%p\n", program);

  /* Build program */
  ret = clBuildProgram(program, 1, &device, "-save-temps", NULL, NULL);
  if (ret != CL_SUCCESS) {
    size_t size;
    char *log;

    /* Get log size */
    clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, 0, NULL,
                          &size);

    /* Allocate log and print */
    log = malloc(size);
    clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, size, log,
                          NULL);
    printf("error: call to 'clBuildProgram' failed:\n%s\n", log);

    /* Free log and exit */
    free(log);
    exit(1);
  }

  printf("program built\n");
  printf("\n");

  /* Release program */
  ret = clReleaseProgram(program);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clReleaseProgram' failed\n");
    exit(1);
  }

  /* Release command queue */
  ret = clReleaseCommandQueue(command_queue);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clReleaseCommandQueue' failed\n");
    exit(1);
  }

  /* Release context */
  ret = clReleaseContext(context);
  if (ret != CL_SUCCESS) {
    printf("error: call to 'clReleaseContext' failed\n");
    exit(1);
  }

  return 0;
}
