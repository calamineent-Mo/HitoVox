
# HitoVox — GitHub-ready repository (for calamineent-Mo)

This repository is prepared so GitHub Actions can build **HitoVox** (VST3) on Windows and create an NSIS installer.
It is configured to be **fully unlocked** (no license checks) for your initial distribution.

IMPORTANT: The CI workflow expects **JUCE** to be available either as:
1. A git submodule at `./JUCE` (recommended), or
2. By setting the `JUCE_DIR` environment variable in the workflow or runner.

---

## Quick upload instructions (non-developer friendly)

1. Download the ZIP you received from me and extract to a folder.
2. Create a GitHub account (if you don't have one): https://github.com
3. On GitHub, click **New repository** -> Name: `HitoVox` -> **Create repository**.
4. On your local machine:
   - Install Git (https://git-scm.com/downloads).
   - Open a terminal (PowerShell) and run:
     ```powershell
     cd C:\path\to\extracted\HitoVox
     git init
     git add .
     git commit -m "Initial HitoVox commit"
     git branch -M main
     git remote add origin https://github.com/calamineent-Mo/HitoVox.git
     git push -u origin main
     ```
   - Alternatively, on GitHub repository page you can **Upload files** using drag-and-drop if you prefer not to use Git locally.

5. Add JUCE as a submodule (recommended). On your local machine:
   ```powershell
   git submodule add https://github.com/juce-framework/JUCE.git JUCE
   git commit -m "Add JUCE submodule"
   git push
   ```

   If you cannot add the submodule, you can set a repository secret `JUCE_DIR` pointing to the path on the runner (advanced).

6. Go to Actions tab on your GitHub repo. You should see the "Build HitoVox (Windows)" workflow. Click it and run **Run workflow** (or push a commit). The runner will:
   - Checkout the repo (with submodules)
   - Configure & build using Visual Studio 2022
   - Run NSIS to create `HitoVox-Installer.exe`
   - Upload artifacts (VST3 and installer) to the workflow run.

7. Download the artifacts from the Actions run, or create a GitHub Release and attach them.

---

## If you prefer I do the GitHub setup for you:
I can prepare a repo-ready ZIP that you can upload directly via GitHub's "Upload files" button. After you upload, if you add JUCE as a submodule (step 5), Actions will build automatically.

---

## After install (Windows)

- Place the produced `HitoVox.vst3` into `%ProgramFiles%\Common Files\VST3` or run the produced installer `HitoVox-Installer.exe`.
- Open your DAW (FL Studio, Cubase, Ableton, Reason). Rescan plugins (in FL Studio: Options -> Manage plugins -> Start scan).
- Insert HitoVox on a vocal track and choose factory presets.

---

## Support
If you prefer I push this repo to your GitHub account and trigger the workflow, reply **"Please upload to my GitHub"** and provide a short-lived GitHub Personal Access Token (PAT) with `repo` scope so I can push the initial commit. Alternatively, you can upload the ZIP yourself using GitHub's web UI and I will guide you through adding JUCE as a submodule.
