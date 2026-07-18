# Figures 规划

> 遵循 writing_guidelines.md：扁平化矢量风格、纯白背景、淡色系、英文标签、无长句子
> 
> 参考 PaddleOCR-VL CVPR 正文共 4 张 Figure：性能对比图(Intro) + 动机对比图(Related) + 架构总览(Method) + 模块细节(Method)
> 我们正文也规划 4-5 张 Figure + 实验中 2-3 张可视化结果图

## 已有图片

| Figure | 文件名 | 用在哪 | 内容描述 | 来源 |
|--------|--------|--------|---------|------|
| Fig 1 (teaser) | `fig1_blackhole_demo.png` | Method 开头 | 原图→K-norm 密度热力图→keep/drop mask→直方图 | assets/ |
| Fig 2 | `fig2_density_newspaper.png` | 实验-定性分析 | 报纸版面 K-norm 密度可视化 | 顶层 density_newspaper.png |
| Fig 2b | `fig2b_density_histograms.png` | 备用 | 密度分布直方图 | 顶层 |
| Fig 3a | `fig3a_rl_step200.png` | 实验-RL演化 | RL Step200 密度对比 | ep9/vis_step200/paper/ |
| Fig 3b | `fig3b_rl_step5000.png` | 实验-RL演化 | RL Step5000 密度对比（收敛V形） | ep9/vis_step5000/paper/ |
| Fig 3c | `fig3c_mask_step200.png` | 备用 | Step200 keep/drop mask | ep9/vis_step200/paper/ |
| Fig 3d | `fig3d_mask_step5000.png` | 备用 | Step5000 keep/drop mask | ep9/vis_step5000/paper/ |
| Fig 4 | `fig4_blackhole_territory.png` | 实验-定性分析 | 吸收者领地 Voronoi 图 | ep9/vis_ep9_final/ |
| Fig 5 | `fig5_pretrained_vs_step10.png` | 备用/Appendix | 预训练 vs SFT 的 Layer9 K-norm 对比 | pretrained_vs_step10/ |
| Fig 6 | `fig6_layer_gap_summary.png` | 消融-层级选择 | 各层 K-norm 文字/空白 gap 汇总图 | knorm_multi_test/ |
| Fig 7a | `fig7a_webui_density_example.png` | 备用 | WebUI 密度可视化示例1 | webui_history/ |
| Fig 7b | `fig7b_webui_density_example2.png` | 备用 | WebUI 密度可视化示例2 | webui_history/ |

## 待画图片

| Figure | 对标CVPR哪张 | 用在哪 | 内容描述 | 优先级 |
|--------|-------------|--------|---------|--------|
| **Fig1 性能对比图** | CVPR Fig1 (metric1.png) | Introduction 第一页顶部 | 左:分项柱状图(Text/Formula/Table/RO) vs 各模型; 右:帕累托图(x=Vision Tokens, y=Overall) 标注我们的位置 | P0 (需要评测数据) |
| **Fig2 动机/对比图** | CVPR Fig2 (method1.jpg) | Introduction/Related 之间 | 左:文档有效区域占比示意; 中:端到端VLM的问题(全量token); 右:我们的方法(自适应压缩后) | P0 (需要画) |
| **Fig3 架构总览图** | CVPR Fig3 (overall.png) | Method §3.1 | 完整pipeline: Image → ViT(L0-8) → K-norm density → threshold 0.5 → BlackHole Merge → ViT(L9-26) → Projector → LLM → Text; 旁路: Policy MLP (RL) | P0 (需要画) |
| **Fig4 密度可视化** | 无（我们特有） | 实验-定性分析 | 2-3种文档(论文/PPT/报纸)并排: 原图 + density heatmap + keep/drop mask | P1 (有素材，需拼接) |
| **Fig5 RL演化** | 无（我们特有） | 实验-定性分析 | RL训练过程density分布变化: Step0(A形) → Step1000 → Step5000(V形) | P1 (有素材，需拼接) |

## 对标 PaddleOCR-VL CVPR 正文的 Figure 分布

| PaddleOCR-VL CVPR | 内容 | 我们的对应 |
|---|---|---|
| Fig1 (Intro页顶) | 性能柱状图 + 帕累托图(tokens vs performance) | → 我们的 Fig1 (待评测数据) |
| Fig2 (Intro/Related) | 动机对比：有效区域占比 + 端到端vs我们 | → 我们的 Fig2 (待画) |
| Fig3 (Method) | 架构总览：VRFM + VLM pipeline | → 我们的 Fig3 (待画) |
| Fig4 (Method) | PP-DocLayoutV2 模块细节 | → 不需要（我们没有子模块那么复杂）|
| -- | -- | → 我们的 Fig4 密度可视化 (有素材) |
| -- | -- | → 我们的 Fig5 RL演化 (有素材) |

## 当前 .tex 中引用关系

```
sec/3_method.tex:
  - \begin{figure*} fig1_blackhole_demo.png → \label{fig:overview}

sec/4_experiments.tex:
  - \begin{figure} fig2_density_newspaper.png → \label{fig:density_vis}
  - \begin{figure} fig3a + fig3b (subfigure) → \label{fig:rl_evolution}
  - \begin{figure} fig4_blackhole_territory.png → \label{fig:territory}
```

## 备注

- 正式投稿前需要将 fig1 替换为专业绘制的架构图
- 所有图中文字需改为英文
- 图片格式建议转为 PDF 矢量格式（对于架构图）或高分辨率 PNG（对于可视化结果）
