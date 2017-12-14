# bazel-ppc64le
Power 8 (ppc64le) Docker image with python 3.5.2 as default, CUDA8, CuDNN 6 and Bazel to build tensorflow from source.

Runs on x86_64 and ppc64le machines, thanks to qemu.

```
docker run -it jayachandranb/bazel-ppc64le:cuda8.0-cudnn6-devel-ubuntu16.04 /bin/bash
```
