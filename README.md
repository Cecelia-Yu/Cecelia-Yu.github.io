# WanyangYu 个人网站

这是直接由 GitHub Pages 托管的静态网站。首页没有 JavaScript、安装依赖或构建步骤。

## 常用文件

- `index.html`：首页文字、联系方式、研究列表和 CV 链接。各部分都有注释。
- `css/academic.css`：首页样式；按基础、导航、个人信息、研究列表、移动端分组。
- `files/WanyangYu_CV.tex`：CV 的 LaTeX 源文件（主要维护此文件）。
- `files/WanyangYu_CV.pdf`：网站链接的定版 CV。
- `files/WanyangYu_CV.docx`：保留的 Word 版本，与 LaTeX 不自动同步。
- `blog/index.html`：原来的 Welcome to my blog 页面。
- `2025/`、`archives/`、`tags/`、`categories/`：已有博客文章和索引。
- `css/main.css`、`css/custom.css`、`js/`、`img/`：旧博客依赖，首页不加载这些文件。

## 修改首页

直接编辑 `index.html`。首页分为 `<aside>` 左侧个人信息和 `<main>` 右侧正文；每个 `<section>` 是一个内容区块。可直接增删段落或区块，无需修改 CSS。参考中的照片保存在 `img/profile.png`，裁切由 CSS 控制。右侧使用自然换行，不设置固定高度或隐藏溢出。

## 更新 CV

直接编辑 `files/WanyangYu_CV.tex`。每个 `\entry{日期}{内容}` 对应一条经历，复制或删除整个条目即可增删。日期在左侧，内容在右侧。

保存后，在仓库根目录的 PowerShell 运行：

```powershell
.\build-cv.ps1
```

需要已安装 TeX Live（本机已有）。脚本编译两次后更新 `files/WanyangYu_CV.pdf`；中间文件留在 `.cv-build/`，不会加入 Git。网页链接无需修改。也可将 `.tex` 上传到 Overleaf 编辑、编译，再下载 PDF 替换同名文件。

## 本地预览：只启动一次

在仓库目录运行：

```powershell
python -m http.server 8765 --bind 127.0.0.1
```

保持该进程运行，打开 http://127.0.0.1:8765/ 。以后修改并保存 `index.html` 或 CSS，直接刷新浏览器即可，不需要重新运行命令。若缓存未更新，按 Ctrl+F5 强制刷新。

只有关闭服务、退出承载服务的会话或重启电脑后，才需要重新启动。端口已被占用时通常是已有服务仍在运行，先打开上面的地址。

LaTeX 源文件的修改需要先运行 `build-cv.ps1` 编译，然后刷新 PDF 页面。网页 HTML/CSS 本身不需要编译。

## 发布与博客维护

将修改提交并推送到 GitHub 后，由仓库已有的 GitHub Pages 设置发布。
当前仓库保存的是 Hexo 生成后的网页，不包含 Hexo 源文件。若从另一份 Hexo 源项目重新生成并覆盖此仓库，首页改动可能被覆盖；请同时保留 `index.html`、`css/academic.css`、`files/` 和 `blog/`，或把这些变更同步到你的 Hexo 源项目。

## 折叠研究项目

每个 `<details>` 是一个研究项目，`<summary>` 是默认显示的标题和日期，`.project` 中是展开内容。复制或删除整个 `<details>...</details>` 即可增删项目。添加 `open` 属性可让某项默认展开。交互由浏览器原生支持，无 JavaScript。
