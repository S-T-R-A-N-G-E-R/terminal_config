<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MLOps Terminal Environment — Dotfiles</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;700;800&family=DM+Mono:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  :root {
    --bg: #020408;
    --bg2: #060d14;
    --surface: #0a1628;
    --border: #0f2a4a;
    --accent: #00d4ff;
    --accent2: #00ff9d;
    --accent3: #ff6b35;
    --text: #c8d8e8;
    --text-dim: #4a6a8a;
    --text-bright: #eaf4ff;
    --glow: rgba(0,212,255,0.15);
    --glow2: rgba(0,255,157,0.1);
    --mono: 'DM Mono', monospace;
    --display: 'Syne', sans-serif;
    --code: 'Space Mono', monospace;
  }

_, _::before, \*::after { box-sizing: border-box; margin: 0; padding: 0; }

html { scroll-behavior: smooth; }

body {
background: var(--bg);
color: var(--text);
font-family: var(--mono);
font-size: 14px;
line-height: 1.8;
overflow-x: hidden;
}

/_ ── BACKGROUND ──────────────────────────────────── _/
body::before {
content: '';
position: fixed; inset: 0; z-index: 0;
background:
radial-gradient(ellipse 80% 50% at 20% 10%, rgba(0,212,255,0.05) 0%, transparent 60%),
radial-gradient(ellipse 60% 40% at 80% 80%, rgba(0,255,157,0.04) 0%, transparent 60%),
repeating-linear-gradient(0deg, transparent, transparent 39px, rgba(0,212,255,0.025) 39px, rgba(0,212,255,0.025) 40px),
repeating-linear-gradient(90deg, transparent, transparent 39px, rgba(0,212,255,0.025) 39px, rgba(0,212,255,0.025) 40px);
pointer-events: none;
}

/_ scanlines _/
body::after {
content: '';
position: fixed; inset: 0; z-index: 0;
background: repeating-linear-gradient(
0deg,
rgba(0,0,0,0.04) 0px,
rgba(0,0,0,0.04) 1px,
transparent 1px,
transparent 3px
);
pointer-events: none;
}

.container {
position: relative; z-index: 1;
max-width: 960px;
margin: 0 auto;
padding: 0 32px;
}

/_ ── HERO ─────────────────────────────────────────── _/
.hero {
padding: 100px 0 60px;
position: relative;
}

.hero-label {
font-family: var(--code);
font-size: 11px;
letter-spacing: 0.3em;
color: var(--accent);
text-transform: uppercase;
margin-bottom: 28px;
display: flex;
align-items: center;
gap: 12px;
opacity: 0;
animation: fadeUp 0.6s ease 0.1s forwards;
}

.hero-label::before {
content: '';
display: block;
width: 40px; height: 1px;
background: var(--accent);
}

.hero h1 {
font-family: var(--display);
font-size: clamp(40px, 7vw, 80px);
font-weight: 800;
line-height: 1.0;
letter-spacing: -0.02em;
color: var(--text-bright);
margin-bottom: 8px;
opacity: 0;
animation: fadeUp 0.7s ease 0.2s forwards;
}

.hero h1 span {
background: linear-gradient(135deg, var(--accent) 0%, var(--accent2) 100%);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
background-clip: text;
}

.hero-sub {
font-family: var(--display);
font-size: clamp(18px, 3vw, 26px);
font-weight: 400;
color: var(--text-dim);
margin-bottom: 40px;
opacity: 0;
animation: fadeUp 0.7s ease 0.3s forwards;
}

.hero-badges {
display: flex;
flex-wrap: wrap;
gap: 10px;
margin-bottom: 56px;
opacity: 0;
animation: fadeUp 0.7s ease 0.4s forwards;
}

.badge {
font-family: var(--code);
font-size: 10px;
letter-spacing: 0.15em;
padding: 5px 14px;
border: 1px solid var(--border);
color: var(--text-dim);
text-transform: uppercase;
background: rgba(10,22,40,0.8);
transition: all 0.2s;
}

.badge:hover {
border-color: var(--accent);
color: var(--accent);
}

.badge.highlight {
border-color: var(--accent2);
color: var(--accent2);
}

/_ ── OBJECTIVES ───────────────────────────────────── _/
.section {
padding: 60px 0;
opacity: 0;
transform: translateY(30px);
transition: opacity 0.7s ease, transform 0.7s ease;
}

.section.visible {
opacity: 1;
transform: none;
}

.section-header {
display: flex;
align-items: center;
gap: 16px;
margin-bottom: 40px;
}

.section-num {
font-family: var(--code);
font-size: 10px;
color: var(--accent);
letter-spacing: 0.2em;
opacity: 0.6;
}

.section-title {
font-family: var(--display);
font-size: 22px;
font-weight: 800;
color: var(--text-bright);
letter-spacing: -0.01em;
text-transform: uppercase;
}

.section-line {
flex: 1;
height: 1px;
background: linear-gradient(to right, var(--border), transparent);
}

/_ ── OBJECTIVE CARDS ──────────────────────────────── _/
.obj-grid {
display: grid;
grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
gap: 1px;
background: var(--border);
border: 1px solid var(--border);
}

.obj-card {
background: var(--bg2);
padding: 28px 24px;
position: relative;
overflow: hidden;
transition: background 0.3s;
}

.obj-card::before {
content: '';
position: absolute;
top: 0; left: 0; right: 0;
height: 2px;
background: linear-gradient(90deg, var(--accent), var(--accent2));
transform: scaleX(0);
transform-origin: left;
transition: transform 0.4s ease;
}

.obj-card:hover { background: var(--surface); }
.obj-card:hover::before { transform: scaleX(1); }

.obj-icon {
font-size: 22px;
margin-bottom: 14px;
}

.obj-title {
font-family: var(--display);
font-size: 13px;
font-weight: 700;
color: var(--accent);
text-transform: uppercase;
letter-spacing: 0.1em;
margin-bottom: 8px;
}

.obj-desc {
font-size: 12px;
color: var(--text-dim);
line-height: 1.7;
}

/_ ── ARSENAL ──────────────────────────────────────── _/
.category-label {
font-family: var(--code);
font-size: 10px;
letter-spacing: 0.3em;
color: var(--accent3);
text-transform: uppercase;
margin-bottom: 20px;
margin-top: 40px;
display: flex;
align-items: center;
gap: 10px;
}

.category-label::after {
content: '';
flex: 1;
height: 1px;
background: linear-gradient(to right, rgba(255,107,53,0.4), transparent);
}

.tools-list {
display: flex;
flex-direction: column;
gap: 2px;
}

.tool-row {
display: grid;
grid-template-columns: 160px 1fr;
gap: 0;
border: 1px solid transparent;
transition: border-color 0.2s, background 0.2s;
}

.tool-row:hover {
border-color: var(--border);
background: var(--surface);
}

.tool-name-cell {
padding: 14px 18px;
border-right: 1px solid var(--border);
display: flex;
align-items: center;
gap: 10px;
}

.tool-name {
font-family: var(--code);
font-size: 12px;
color: var(--accent2);
white-space: nowrap;
}

.tool-cmd {
font-family: var(--code);
font-size: 10px;
color: var(--text-dim);
opacity: 0.6;
}

.tool-desc-cell {
padding: 14px 18px;
font-size: 12px;
color: var(--text-dim);
line-height: 1.6;
}

.tool-desc-cell strong {
color: var(--text);
font-weight: 500;
}

/_ ── INSTALL ──────────────────────────────────────── _/
.install-grid {
display: grid;
grid-template-columns: 1fr 1fr;
gap: 1px;
background: var(--border);
border: 1px solid var(--border);
}

@media (max-width: 600px) {
.install-grid { grid-template-columns: 1fr; }
}

.install-card {
background: var(--bg2);
padding: 32px;
}

.install-card-header {
display: flex;
align-items: flex-start;
gap: 16px;
margin-bottom: 24px;
}

.install-tag {
font-family: var(--code);
font-size: 9px;
letter-spacing: 0.2em;
padding: 4px 10px;
border: 1px solid;
text-transform: uppercase;
white-space: nowrap;
margin-top: 3px;
}

.install-tag.a { border-color: var(--accent); color: var(--accent); }
.install-tag.b { border-color: var(--accent2); color: var(--accent2); }

.install-card-title {
font-family: var(--display);
font-size: 16px;
font-weight: 700;
color: var(--text-bright);
margin-bottom: 4px;
}

.install-card-sub {
font-size: 11px;
color: var(--text-dim);
font-style: italic;
}

.steps {
display: flex;
flex-direction: column;
gap: 16px;
}

.step {
display: flex;
gap: 14px;
}

.step-num {
font-family: var(--code);
font-size: 10px;
color: var(--accent);
min-width: 20px;
padding-top: 2px;
opacity: 0.6;
}

.step-content {
flex: 1;
}

.step-title {
font-family: var(--display);
font-size: 12px;
font-weight: 700;
color: var(--text);
text-transform: uppercase;
letter-spacing: 0.05em;
margin-bottom: 8px;
}

/_ ── CODE BLOCKS ──────────────────────────────────── _/
.codeblock {
background: #020c18;
border: 1px solid var(--border);
padding: 16px 18px;
margin: 8px 0;
position: relative;
overflow-x: auto;
}

.codeblock::before {
content: '';
position: absolute;
top: 0; left: 0; right: 0;
height: 1px;
background: linear-gradient(90deg, var(--accent), transparent 60%);
opacity: 0.5;
}

.codeblock code {
font-family: var(--code);
font-size: 11px;
color: var(--text);
display: block;
white-space: pre;
}

.codeblock code .cmd { color: var(--accent); }
.codeblock code .arg { color: var(--accent2); }
.codeblock code .comment { color: var(--text-dim); font-style: italic; }
.codeblock code .path { color: var(--accent3); }

/_ ── PREREQS ──────────────────────────────────────── _/
.prereq-block {
border: 1px solid var(--border);
background: var(--bg2);
padding: 28px 32px;
margin-bottom: 32px;
position: relative;
}

.prereq-block::before {
content: 'PREREQUISITES';
position: absolute;
top: -1px; left: 24px;
transform: translateY(-50%);
background: var(--bg2);
font-family: var(--code);
font-size: 9px;
letter-spacing: 0.25em;
color: var(--accent3);
padding: 0 8px;
}

/_ ── NOTES ────────────────────────────────────────── _/
.notes-grid {
display: grid;
grid-template-columns: 1fr 1fr;
gap: 1px;
background: var(--border);
border: 1px solid var(--border);
}

@media (max-width: 600px) {
.notes-grid { grid-template-columns: 1fr; }
}

.note-card {
background: var(--bg2);
padding: 28px;
position: relative;
}

.note-card::after {
content: '';
position: absolute;
bottom: 0; left: 0; right: 0;
height: 1px;
background: linear-gradient(90deg, transparent, var(--accent2), transparent);
opacity: 0.3;
}

.note-icon {
font-size: 20px;
margin-bottom: 12px;
}

.note-title {
font-family: var(--display);
font-size: 13px;
font-weight: 700;
color: var(--accent2);
text-transform: uppercase;
letter-spacing: 0.08em;
margin-bottom: 10px;
}

.note-body {
font-size: 12px;
color: var(--text-dim);
line-height: 1.7;
}

.note-body code {
font-family: var(--code);
color: var(--accent);
background: rgba(0,212,255,0.08);
padding: 1px 5px;
font-size: 11px;
}

/_ ── MAINTENANCE ──────────────────────────────────── _/
.maint-block {
border: 1px solid var(--border);
background: var(--bg2);
padding: 32px;
display: grid;
grid-template-columns: 1fr 1fr;
gap: 32px;
align-items: center;
}

@media (max-width: 600px) {
.maint-block { grid-template-columns: 1fr; }
}

.maint-text p {
font-size: 12px;
color: var(--text-dim);
line-height: 1.7;
margin-bottom: 8px;
}

.maint-text p:last-child { margin-bottom: 0; }

/_ ── FOOTER ───────────────────────────────────────── _/
.footer {
padding: 60px 0 80px;
border-top: 1px solid var(--border);
display: flex;
justify-content: space-between;
align-items: flex-end;
gap: 20px;
flex-wrap: wrap;
}

.footer-left {
font-family: var(--display);
font-size: 11px;
color: var(--text-dim);
letter-spacing: 0.05em;
}

.footer-right {
font-family: var(--code);
font-size: 10px;
color: var(--text-dim);
letter-spacing: 0.1em;
text-align: right;
}

.footer-sig {
font-family: var(--display);
font-size: 28px;
font-weight: 800;
color: var(--border);
letter-spacing: -0.02em;
margin-top: 4px;
}

/_ ── DIVIDER ──────────────────────────────────────── _/
.divider {
height: 1px;
background: linear-gradient(to right, transparent, var(--border), transparent);
margin: 8px 0;
}

/_ ── CORNER DECORATION ────────────────────────────── _/
.corner-deco {
position: absolute;
width: 20px; height: 20px;
}

/_ ── ANIMATIONS ───────────────────────────────────── _/
@keyframes fadeUp {
from { opacity: 0; transform: translateY(20px); }
to { opacity: 1; transform: none; }
}

@keyframes pulse-accent {
0%, 100% { box-shadow: 0 0 0 0 rgba(0,212,255,0); }
50% { box-shadow: 0 0 20px 4px rgba(0,212,255,0.15); }
}

@keyframes blink {
0%, 100% { opacity: 1; }
50% { opacity: 0; }
}

.cursor {
display: inline-block;
width: 8px; height: 15px;
background: var(--accent);
vertical-align: middle;
animation: blink 1s step-end infinite;
margin-left: 4px;
}

/_ ── TERMINAL HEADER ACCENT ───────────────────────── _/
.terminal-bar {
background: var(--surface);
border: 1px solid var(--border);
border-bottom: none;
padding: 10px 16px;
display: flex;
align-items: center;
gap: 8px;
}

.terminal-dot {
width: 10px; height: 10px; border-radius: 50%;
}
.terminal-dot.r { background: #ff5f57; }
.terminal-dot.y { background: #febc2e; }
.terminal-dot.g { background: #28c840; }

.terminal-title {
font-family: var(--code);
font-size: 10px;
color: var(--text-dim);
margin-left: 8px;
letter-spacing: 0.1em;
}

a { color: var(--accent); text-decoration: none; }
a:hover { text-decoration: underline; }

/_ scroll reveal _/
.reveal {
opacity: 0;
transform: translateY(24px);
transition: opacity 0.65s ease, transform 0.65s ease;
}
.reveal.visible {
opacity: 1;
transform: none;
}
</style>

</head>
<body>

<div class="container">

  <!-- ── HERO ──────────────────────────────────────── -->
  <section class="hero">
    <div class="hero-label">dotfiles v2.0 &mdash; MLOps Edition</div>
    <h1>The Ultimate<br><span>Terminal Environment</span></h1>
    <p class="hero-sub">MLOps &amp; Data Science &mdash; Turbo Charged</p>
    <div class="hero-badges">
      <span class="badge highlight">Zsh</span>
      <span class="badge highlight">Starship</span>
      <span class="badge">Rust-based CLI</span>
      <span class="badge">Modern TUIs</span>
      <span class="badge">macOS</span>
      <span class="badge">Homebrew</span>
      <span class="badge">Conda-ready</span>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── OBJECTIVES ────────────────────────────────── -->
  <section class="section reveal">
    <div class="section-header">
      <span class="section-num">01</span>
      <span class="section-title">Objectives</span>
      <div class="section-line"></div>
    </div>
    <div class="obj-grid">
      <div class="obj-card">
        <div class="obj-icon">⚡</div>
        <div class="obj-title">Zero Friction</div>
        <div class="obj-desc">Eliminate repetitive typing with intelligent aliases and smart directory jumping.</div>
      </div>
      <div class="obj-card">
        <div class="obj-icon">🎨</div>
        <div class="obj-title">Visual Feedback</div>
        <div class="obj-desc">Rich, colorized output for code, data, and system resources directly in the terminal.</div>
      </div>
      <div class="obj-card">
        <div class="obj-icon">🤖</div>
        <div class="obj-title">Env Automation</div>
        <div class="obj-desc">Seamlessly manage Python/Conda environments without prompt clutter.</div>
      </div>
      <div class="obj-card">
        <div class="obj-icon">♾️</div>
        <div class="obj-title">Reproducibility</div>
        <div class="obj-desc">Instant recreation on any new macOS machine, or safe integration in minutes.</div>
      </div>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── ARSENAL ────────────────────────────────────── -->
  <section class="section reveal">
    <div class="section-header">
      <span class="section-num">02</span>
      <span class="section-title">The Arsenal</span>
      <div class="section-line"></div>
    </div>
    <p style="font-size:12px;color:var(--text-dim);margin-bottom:8px;">
      The included <code style="color:var(--accent);font-family:var(--code);font-size:11px;background:rgba(0,212,255,0.07);padding:2px 6px">Brewfile</code> acts as a package manager blueprint — a single command installs everything below.
    </p>

    <!-- Core -->
    <div class="category-label">Core Terminal Enhancements</div>
    <div class="tools-list">
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Starship</span><span class="tool-cmd">starship</span></div>
        <div class="tool-desc-cell"><strong>Cross-shell prompt</strong> — Git status, Python version, and Cloud context. Informative but never cluttered.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Zoxide</span><span class="tool-cmd">zoxide</span></div>
        <div class="tool-desc-cell"><strong>Smarter <code style="color:var(--accent);font-family:var(--code);font-size:10px">cd</code></strong> — remembers frequent dirs so you type <code style="color:var(--accent);font-family:var(--code);font-size:10px">z proj</code> instead of the full path.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Eza</span><span class="tool-cmd">eza</span></div>
        <div class="tool-desc-cell"><strong>Modern <code style="color:var(--accent);font-family:var(--code);font-size:10px">ls</code></strong> — color-coding, Git integration, and file icons. Aliased to <code style="color:var(--accent);font-family:var(--code);font-size:10px">ls</code>, <code style="color:var(--accent);font-family:var(--code);font-size:10px">ll</code>, and <code style="color:var(--accent);font-family:var(--code);font-size:10px">tree</code>.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Bat</span><span class="tool-cmd">bat</span></div>
        <div class="tool-desc-cell"><strong>cat with superpowers</strong> — syntax highlighting and Git integration. Reading Python or JSON is actually readable.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Fzf</span><span class="tool-cmd">fzf</span></div>
        <div class="tool-desc-cell"><strong>Fuzzy finder</strong> — instantly search through files, command history, and directories.</div>
      </div>
    </div>

    <!-- TUIs -->
    <div class="category-label">God-Tier TUIs</div>
    <div class="tools-list">
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Lazygit</span><span class="tool-cmd">lazygit</span></div>
        <div class="tool-desc-cell"><strong>Full Git UI in your terminal</strong> — stage individual lines, resolve merge conflicts, and manage branches with zero memorization.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Lazydocker</span><span class="tool-cmd">lazydocker</span></div>
        <div class="tool-desc-cell"><strong>Docker management TUI</strong> — same brilliant interface for containers, images, and volumes.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Btop</span><span class="tool-cmd">btop</span></div>
        <div class="tool-desc-cell"><strong>Cyberpunk resource monitor</strong> — far superior to <code style="color:var(--accent);font-family:var(--code);font-size:10px">top</code> for tracking CPU and RAM during heavy model training.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">K9s</span><span class="tool-cmd">k9s</span></div>
        <div class="tool-desc-cell"><strong>Kubernetes terminal dashboard</strong> — navigate deployments, view real-time pod logs, and shell into containers.</div>
      </div>
    </div>

    <!-- Data & API -->
    <div class="category-label">Data &amp; API Tools</div>
    <div class="tools-list">
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">HTTPie</span><span class="tool-cmd">httpie</span></div>
        <div class="tool-desc-cell"><strong>Modern curl replacement</strong> — intuitive syntax, automatic JSON formatting, and colorized API responses.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">VisiData</span><span class="tool-cmd">visidata</span></div>
        <div class="tool-desc-cell"><strong>Terminal spreadsheet</strong> — instantly open massive CSVs, JSON, or SQLite databases without writing a Pandas script.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Harlequin</span><span class="tool-cmd">harlequin</span></div>
        <div class="tool-desc-cell"><strong>Terminal SQL IDE</strong> — query databases with syntax highlighting and a data catalog sidebar.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">jq &amp; yq</span><span class="tool-cmd">jq / yq</span></div>
        <div class="tool-desc-cell"><strong>JSON &amp; YAML processors</strong> — essential for parsing API responses or manipulating Kubernetes manifests.</div>
      </div>
    </div>

    <!-- Workspace -->
    <div class="category-label">Workspace &amp; Workflow</div>
    <div class="tools-list">
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">Zellij</span><span class="tool-cmd">zellij</span></div>
        <div class="tool-desc-cell"><strong>Modern tmux alternative</strong> — split panes, detach/reattach to long-running scripts so they survive connection drops.</div>
      </div>
      <div class="tool-row">
        <div class="tool-name-cell"><span class="tool-name">GitHub CLI</span><span class="tool-cmd">gh</span></div>
        <div class="tool-desc-cell"><strong>GitHub without a browser</strong> — manage PRs, issues, and repo creation entirely from the terminal.</div>
      </div>
    </div>

  </section>

  <div class="divider"></div>

  <!-- ── INSTALLATION ───────────────────────────────── -->
  <section class="section reveal">
    <div class="section-header">
      <span class="section-num">03</span>
      <span class="section-title">Installation</span>
      <div class="section-line"></div>
    </div>

    <!-- Prerequisites -->
    <div class="prereq-block">
      <p style="font-size:12px;color:var(--text-dim);margin-bottom:16px;">Ensure <strong style="color:var(--text)">Homebrew</strong> is installed, then clone this repository and install the full toolset:</p>
      <div class="terminal-bar">
        <div class="terminal-dot r"></div>
        <div class="terminal-dot y"></div>
        <div class="terminal-dot g"></div>
        <span class="terminal-title">zsh — prerequisites</span>
      </div>
      <div class="codeblock" style="margin:0">
        <code><span class="comment"># Install Homebrew</span>

<span class="cmd">/bin/bash</span> -c "<span class="arg">$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)</span>"

<span class="comment"># Clone and install</span>
<span class="cmd">git clone</span> <span class="arg">https://github.com/YOUR-USERNAME/terminal_config.git</span> <span class="path">~/dotfiles</span>
<span class="cmd">cd</span> <span class="path">~/dotfiles</span>
<span class="cmd">brew bundle</span></code>
</div>
</div>

    <!-- Method cards -->
    <div class="install-grid">
      <!-- Method A -->
      <div class="install-card">
        <div class="install-card-header">
          <span class="install-tag a">Method A</span>
          <div>
            <div class="install-card-title">Clean Slate</div>
            <div class="install-card-sub">For a fresh Mac with no existing config</div>
          </div>
        </div>
        <div class="steps">
          <div class="step">
            <span class="step-num">01</span>
            <div class="step-content">
              <div class="step-title">Clear Default Configs</div>
              <div class="terminal-bar"><div class="terminal-dot r"></div><div class="terminal-dot y"></div><div class="terminal-dot g"></div></div>
              <div class="codeblock" style="margin:0">
                <code><span class="cmd">rm -f</span> <span class="path">~/.zshrc</span>

<span class="cmd">rm -f</span> <span class="path">~/.config/starship.toml</span>
<span class="cmd">mkdir -p</span> <span class="path">~/.config</span></code>
</div>
</div>
</div>
<div class="step">
<span class="step-num">02</span>
<div class="step-content">
<div class="step-title">Create Symlinks</div>
<div class="terminal-bar"><div class="terminal-dot r"></div><div class="terminal-dot y"></div><div class="terminal-dot g"></div></div>
<div class="codeblock" style="margin:0">
<code><span class="cmd">ln -s</span> <span class="path">~/dotfiles/.zshrc ~/.zshrc</span>
<span class="cmd">ln -s</span> <span class="path">~/dotfiles/starship.toml</span>
<span class="path">~/.config/starship.toml</span></code>
</div>
</div>
</div>
<div class="step">
<span class="step-num">03</span>
<div class="step-content">
<div class="step-title">Apply &amp; Enjoy</div>
<div class="terminal-bar"><div class="terminal-dot r"></div><div class="terminal-dot y"></div><div class="terminal-dot g"></div></div>
<div class="codeblock" style="margin:0">
<code><span class="cmd">source</span> <span class="path">~/.zshrc</span></code>
</div>
</div>
</div>
</div>
</div>

      <!-- Method B -->
      <div class="install-card">
        <div class="install-card-header">
          <span class="install-tag b">Method B</span>
          <div>
            <div class="install-card-title">Safe Install</div>
            <div class="install-card-sub">For existing setups — non-destructive</div>
          </div>
        </div>
        <div class="steps">
          <div class="step">
            <span class="step-num">01</span>
            <div class="step-content">
              <div class="step-title">Link Starship Theme</div>
              <div class="terminal-bar"><div class="terminal-dot r"></div><div class="terminal-dot y"></div><div class="terminal-dot g"></div></div>
              <div class="codeblock" style="margin:0">
                <code><span class="cmd">mkdir -p</span> <span class="path">~/.config</span>

<span class="cmd">mv</span> <span class="path">~/.config/starship.toml</span>
<span class="path">~/.config/starship_backup.toml</span> <span class="comment">|| true</span>
<span class="cmd">ln -s</span> <span class="path">~/dotfiles/starship.toml</span>
<span class="path">~/.config/starship.toml</span></code>
</div>
</div>
</div>
<div class="step">
<span class="step-num">02</span>
<div class="step-content">
<div class="step-title">Source into Existing .zshrc</div>
<div class="terminal-bar"><div class="terminal-dot r"></div><div class="terminal-dot y"></div><div class="terminal-dot g"></div></div>
<div class="codeblock" style="margin:0">
<code><span class="cmd">echo</span> <span class="arg">"source ~/dotfiles/.zshrc"</span> >> <span class="path">~/.zshrc</span></code>
</div>
</div>
</div>
<div class="step">
<span class="step-num">03</span>
<div class="step-content">
<div class="step-title">Apply &amp; Enjoy</div>
<div class="terminal-bar"><div class="terminal-dot r"></div><div class="terminal-dot y"></div><div class="terminal-dot g"></div></div>
<div class="codeblock" style="margin:0">
<code><span class="cmd">source</span> <span class="path">~/.zshrc</span></code>
</div>
</div>
</div>
</div>
</div>
</div>

  </section>

  <div class="divider"></div>

  <!-- ── NOTES ──────────────────────────────────────── -->
  <section class="section reveal">
    <div class="section-header">
      <span class="section-num">04</span>
      <span class="section-title">Custom Configurations</span>
      <div class="section-line"></div>
    </div>
    <div class="notes-grid">
      <div class="note-card">
        <div class="note-icon">🐍</div>
        <div class="note-title">Smart Conda Wrapper</div>
        <div class="note-body">The <code>.zshrc</code> includes a custom wrapper that intercepts <code>conda create</code> and prompts you to auto-generate a <code>.envrc</code> file — integrating seamlessly with <code>direnv</code> for automatic environment activation on <code>cd</code>.</div>
      </div>
      <div class="note-card">
        <div class="note-icon">✨</div>
        <div class="note-title">Clean Prompting</div>
        <div class="note-body">The <code>starship.toml</code> is heavily tuned to remove unnecessary brackets, leaving only clean icons and essential path/git context. Conda's native <code>(base)</code> hijacking is explicitly disabled in favor of Starship's handling. Run <code>conda config --set auto_activate_base false</code> to ensure this.</div>
      </div>
    </div>
  </section>

  <div class="divider"></div>

  <!-- ── MAINTENANCE ───────────────────────────────── -->
  <section class="section reveal">
    <div class="section-header">
      <span class="section-num">05</span>
      <span class="section-title">Maintenance</span>
      <div class="section-line"></div>
    </div>
    <div class="maint-block">
      <div class="maint-text">
        <p>If you install a new tool via Homebrew that you want to add to this repository permanently, run the following inside the <code style="color:var(--accent);font-family:var(--code);font-size:11px">~/dotfiles</code> directory to update the Brewfile:</p>
        <p style="margin-top:12px;color:var(--text-dim)">Then commit the updated <code style="color:var(--accent);font-family:var(--code);font-size:11px">Brewfile</code> to Git to keep everything reproducible.</p>
      </div>
      <div>
        <div class="terminal-bar">
          <div class="terminal-dot r"></div>
          <div class="terminal-dot y"></div>
          <div class="terminal-dot g"></div>
          <span class="terminal-title">zsh — update brewfile</span>
        </div>
        <div class="codeblock" style="margin:0">
          <code><span class="cmd">cd</span> <span class="path">~/dotfiles</span>
<span class="cmd">brew bundle dump</span> <span class="arg">-f</span>
<span class="cmd">git add</span> Brewfile
<span class="cmd">git commit</span> <span class="arg">-m</span> "chore: update Brewfile"
<span class="cmd">git push</span></code>
        </div>
      </div>
    </div>
  </section>

  <!-- ── FOOTER ─────────────────────────────────────── -->
  <footer class="footer">
    <div class="footer-left">
      MLOps Terminal Environment &mdash; Dotfiles<br>
      <span style="opacity:0.4;font-size:10px;letter-spacing:0.1em">BUILT FOR SPEED. BUILT FOR THE TERMINAL.</span>
      <div class="footer-sig">DOTFILES</div>
    </div>
    <div class="footer-right">
      <span style="color:var(--accent)">$</span> brew bundle<span class="cursor"></span><br><br>
      <span style="opacity:0.4;">All packages installed successfully.</span>
    </div>
  </footer>

</div>

<script>
  // Scroll reveal
  const reveals = document.querySelectorAll('.reveal');
  const observer = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.classList.add('visible');
        observer.unobserve(e.target);
      }
    });
  }, { threshold: 0.08 });
  reveals.forEach(el => observer.observe(el));
</script>

</body>
</html>
