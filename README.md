```
                                    ╱|、
                                   (˚ˎ 。7
                                    |、˜〵
                                    じしˍ,)ノ

             ██████╗ ███╗   ███╗ █████╗ ██╗  ██╗
            ██╔═══██╗████╗ ████║██╔══██╗╚██╗██╔╝
            ██║   ██║██╔████╔██║███████║ ╚███╔╝
            ██║▄▄ ██║██║╚██╔╝██║██╔══██║ ██╔██╗
            ╚██████╔╝██║ ╚═╝ ██║██║  ██║██╔╝ ██╗
             ╚══▀▀═╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
                             c o d e
```

# qmax-code

**AI-powered terminal agent for QualityMax.** Named after Max, the real cat who inspired it all.

<p align="center">
  <img src="assets/max-the-cat.gif" alt="Max the cat" width="300">
  <br>
  <em>Named after Max, the real cat who inspired it all.</em>
</p>

**The first AI testing agent built for your terminal.**

48 MCP tools, natural language interface, self-healing scripts, cloud execution, k6 load testing — all from the command line. Nothing else does this.

[Product Page](https://qualitymax.io/qmax-code) · [QualityMax Platform](https://app.qualitymax.io) · [Source Code](https://github.com/Quality-Max/qmax-code) · [Releases](https://github.com/Quality-Max/qmax-code-releases/releases)

> **This is the releases repository** — binary downloads and install scripts only.
> The source code lives at [Quality-Max/qmax-code](https://github.com/Quality-Max/qmax-code).

---

## Install

**One command:**

```bash
curl -sL https://qualitymax.io/static/install-qmax-code.txt | bash
```

**Or download a binary:**

| Platform | Download |
|----------|----------|
| macOS Apple Silicon | [qmax-code-darwin-arm64.tar.gz](https://github.com/Quality-Max/qmax-code-releases/releases/latest/download/qmax-code-darwin-arm64.tar.gz) |
| macOS Intel | [qmax-code-darwin-amd64.tar.gz](https://github.com/Quality-Max/qmax-code-releases/releases/latest/download/qmax-code-darwin-amd64.tar.gz) |
| Linux x64 | [qmax-code-linux-amd64.tar.gz](https://github.com/Quality-Max/qmax-code-releases/releases/latest/download/qmax-code-linux-amd64.tar.gz) |
| Linux ARM | [qmax-code-linux-arm64.tar.gz](https://github.com/Quality-Max/qmax-code-releases/releases/latest/download/qmax-code-linux-arm64.tar.gz) |
| Windows x64 | [qmax-code-windows-amd64.zip](https://github.com/Quality-Max/qmax-code-releases/releases/latest/download/qmax-code-windows-amd64.zip) |
| Windows ARM | [qmax-code-windows-arm64.zip](https://github.com/Quality-Max/qmax-code-releases/releases/latest/download/qmax-code-windows-arm64.zip) |

**Or move the binary manually:**

```bash
# After downloading and extracting:
chmod +x qmax-code-* && sudo mv qmax-code-* /usr/local/bin/qmax-code
```

## Quick Start

```bash
# Install
curl -sL https://qualitymax.io/static/install-qmax-code.txt | bash

# Launch — interactive setup guides you through login
qmax-code

# Or jump straight in
qmax-code "crawl staging.myapp.com and generate tests"
```

On first run, Max the cat walks you through:
1. **Connect** — browser opens, click authorize (like Railway CLI)
2. **Pick a project** — or create one on the spot
3. **Set your LLM key** — stored in OS keychain, never plaintext

## What Can It Do?

### Talk naturally. Max handles the rest.

```
qmax > import https://github.com/my-org/my-app and generate tests

  ✓ Project created: my-app (ID: 142)
  ✓ Repository imported
  ✓ 23 test cases generated
  ✓ 8 Playwright scripts auto-generated

qmax > run all tests

  ⠹ ████████████████████░░░░░░░░░░ [32s] 70% Running test 6/8...
  ✓ 6 passed  ✗ 2 failed

qmax > heal the failures

  🔧 Script #1204: Fixed password selector
  🔧 Script #1207: Updated nav link text
  ✓ Re-run: 8/8 passed
```

### 48 Tools Across 8 Categories

| Category | Tools | What they do |
|----------|-------|-------------|
| **AI Crawl** | `start_crawl`, `crawl_results` | Point at a URL, get Playwright tests |
| **k6 Performance** | `k6_generate`, `k6_run_test`, `k6_report` | Load, stress, spike, soak testing |
| **Test Execution** | `run_test`, `run_local_test` | Cloud (BrowserBase) or local (pytest/playwright) |
| **Self-Healing** | `update_script`, `rollback_script` | Fix broken selectors, rollback if worse |
| **Test Management** | `create_test_case`, `enhance_test_case` | Full CRUD + AI enhancement |
| **CI/CD** | `export_framework`, `trigger_framework_run` | GitHub Actions, one-click setup |
| **Repository** | `import_repo`, `generate_gap_tests` | Import, analyze, find testing gaps |
| **QTML** | `export_qtml`, `import_qtml` | Portable test markup language |

### Terminal Commands

| Command | What it does |
|---------|-------------|
| `/connect` | Browser-based login (Railway-style) |
| `/disconnect` | Log out |
| `/keys` | Interactive API key management |
| `/status` | Connection + session info |
| `/screenshot` | Capture screen, send to AI for analysis |
| `/paste` | Paste image or text from clipboard |
| `/project <id>` | Switch active project |
| `/help` | Show all commands |

## Features

### Browser Auth
Type `/connect`. Browser opens. Click "Authorize". Done. No copy-pasting API keys.

### OS Keychain Security
API keys stored in macOS Keychain or Linux secret-tool. Masked input while typing. Never written to plaintext files.

### Syntax Highlighting
Code blocks rendered with full syntax highlighting via glamour. JavaScript, Python, YAML — all colored in your terminal.

### Screenshot & Image Support
- `/screenshot` — capture a screen region, AI analyzes it
- `/paste` — paste images from clipboard
- Drag image files into terminal — auto-attached to conversation

### Progress Bar + Browser Animation
Live ASCII browser animation during cloud test execution with progress bar, elapsed time, and status.

### Local Test Runner
Run pytest or Playwright tests locally. Results automatically reported back to the QualityMax platform.

### Error Reporting
Built-in Bugsink integration. Panics and errors reported automatically so we can fix issues before you notice them.

## Requirements

- **LLM API key** — Anthropic, OpenAI, or other supported provider (BYOLLM)
- **QualityMax account** — free tier available at [app.qualitymax.io](https://app.qualitymax.io)
- **macOS, Linux, or Windows**

## How It's Different

| | qmax-code | AI Assistants | Test Platforms |
|---|---|---|---|
| Terminal AI agent | Yes | No | No |
| Natural language QA | Yes | Code suggestions only | No |
| AI crawl + test gen | Yes | No | Record only |
| Cloud execution | Yes | No | Yes |
| Self-healing | Yes | No | Basic |
| k6 load testing | Yes | No | No |
| CI/CD export | Yes | No | Config only |
| BYOLLM / open source | Yes | No | No |
| Behind firewalls | Yes | Yes | No |

## Links

- [Product Page](https://qualitymax.io/qmax-code)
- [QualityMax Platform](https://app.qualitymax.io)
- [Source Code](https://github.com/Quality-Max/qmax-code)
- [API Documentation](https://qualitymax.io/api-guide)
- [Blog](https://qualitymax.io/blog)
- [Building qmax-code: Why We Built Our Own AI Testing Agent](https://qualitymax.io/blog/building-qmax-code)

## License

[FSL-1.1-ALv2](LICENSE) — free to use for non-competing purposes. Converts to Apache 2.0 two years after each release.

---

<p align="center">
  <sub>Built by <a href="https://qualitymax.io/about">QualityMax</a> in Berlin. Max the cat approves.</sub>
</p>
