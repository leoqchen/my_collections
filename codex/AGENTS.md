## Git

- Add a blank line after the normal commit message, followed by: Co-Authored-By: <Model> <Effort>.
- If the current Codex session ID is reliably available, also append:  Codex-Session: <session-id>


## 自研GPU

### Imagination B-Series BXT-32-1024

- 每个Core有2个SPU，每个SPU有2个USC。
- 每个Core的FP32理论性能是 1024 operations per clock。
- 每个Core的FP16理论性能是 1024 operations per clock。
- 每个Core的Integer理论性能是 256 operations per clock。
- 每个Core的几何理论性能是 1 triangels per clock。(也就说，每个SPU是 0.5 triangles per clock）。
- 每个Core的纹理采样理论性能是 32 texels per clock。
- 每个Core的Pixel理论性能是 32 pixels per clock。

### Imagination D-Series DXD-72-2304

- 每个Core有3个SPU，每个SPU有3个USC。
- 每个Core的FP32理论性能是 2304 operations per clock。
- 每个Core的FP16理论性能是 4608 operations per clock。
- 每个Core的Integer理论性能是 576 operations per clock。
- 每个Core的DOT8 NN理论性能是 9216 operations per clock。
- 每个Core的几何理论性能是 1.5 triangels per clock。(也就说，每个SPU是 0.5 triangles per clock）。
- 每个Core的纹理采样理论性能是 72 texels per clock。
- 每个Core的Pixel理论性能是 48 pixels per clock。

### Imagination B-Series、D-Series 共有的架构短板：

1. 几何处理阶段只能单核处理，无法多核并行处理。
2. 不支持多核之间的atomic操作，遇到atomic操作是需要fall back到单核模式。
3. subgroup操作是软模拟实现。
4. GPU Driven性能表现差。
5. 硬件不支持fp64。但OpenGL驱动提供了软件fp64实现。

### Imagination F-Series FXD-64-2048

- 每个Core有4个SPU，每个SPU有2个USC。
- 每个Core的FP32理论性能是 2048 operations per clock。
- 每个Core的Integer理论性能是 512 operations per clock。
- 每个Core的几何理论性能是 4 triangels per clock。(也就说，每个SPU是 1 triangles per clock）。
- 每个Core的纹理采样理论性能是 64 texels per clock。
- 支持几何阶段的多核并行处理，不再只能单核运行。其几何的多核并行度约75%。
- 支持subgroup的硬件实现。
- 依旧不支持多核之间的atomic操作，遇到atomic操作是需要fall back到单核模式。

### 竞品GPU

- Fuxi是已量产的自研GPU，SNG是下一代自研GPU。
- 竞品GPU是 MooreS80（摩尔S80)、LisuanUltra（砺算）、RTX 3060。
- MooreS80是基于Imagination B-Series 的 BXT IP 为基础，BXT-32-1024 MC8，8核。工作频率大约是1.8GHz。fp32理论算力是14.7 TFLOPS。每个核的几何能力是1 triangles/cycle。
- Fuxi是基于Imagination DXD IP 为基础，DXD-72-2304 MC2，2核。工作频率大约是1.2GHz。fp32理论算力是5.5 TFLOPS。每个核的几何能力是1.5 triangles/cycle。
- Lisuan是源自于S3 GPU的技术。是我们自研GPU重点需要研究、追上、超越的竞品GPU。工作频率大约是1.8GHz。fp32理论算力虽然宣传上最大可达24TFLOPS，但是实测可知其理论算力应该是12TFLOPS。根据众多公开的游戏评测表明，其实际表现，如果优化的话相当于RTX 3060的80%，如果优化不好就相当于GTX 1060。
- SNG是基于Imagination FXD IP 为基础，FXD-64-2048 MC6，6核。工作频率大约是1.8GHz。fp32理论算力是22 TFLOPS。每个核的几何能力是4 triangles/cycle。


