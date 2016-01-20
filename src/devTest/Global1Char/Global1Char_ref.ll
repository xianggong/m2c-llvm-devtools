; ModuleID = 'Global1Char.cl'
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-p24:64:64-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn-unknown-unknown-unknown"

; Function Attrs: nounwind
define void @Global1(i8 addrspace(1)* nocapture %result) #0 {
entry:
  %x.i.i = tail call i32 @llvm.r600.read.tgid.x() #1
  %x.i.12.i = tail call i32 @llvm.r600.read.local.size.x() #1
  %mul.26.i = mul i32 %x.i.12.i, %x.i.i
  %x.i.4.i = tail call i32 @llvm.r600.read.tidig.x() #1
  %add.i = add i32 %x.i.4.i, %mul.26.i
  %conv = trunc i32 %add.i to i8
  %0 = sext i32 %add.i to i64
  %arrayidx = getelementptr inbounds i8, i8 addrspace(1)* %result, i64 %0
  store i8 %conv, i8 addrspace(1)* %arrayidx, align 1, !tbaa !8
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.tgid.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.local.size.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.tidig.x() #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="verde" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!opencl.kernels = !{!0}
!llvm.ident = !{!6, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7}

!0 = !{void (i8 addrspace(1)*)* @Global1, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1}
!2 = !{!"kernel_arg_access_qual", !"none"}
!3 = !{!"kernel_arg_type", !"char*"}
!4 = !{!"kernel_arg_base_type", !"char*"}
!5 = !{!"kernel_arg_type_qual", !""}
!6 = !{!"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 73e976449b53bf91364bec5926194b37f7f08488) (https://github.com/llvm-mirror/llvm.git e48de91069450173c2d5abaad9da9b25920ef692)"}
!7 = !{!"clang version 3.8.0 (https://github.com/llvm-mirror/clang.git 61690d9018c8da94a7812ae53d501af17f0cf265) (https://github.com/llvm-mirror/llvm.git 591adee23bf68ecae9fccd35c937dd03d15a054e)"}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
