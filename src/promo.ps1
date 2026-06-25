<#
.SYNOPSIS
  BraveOriginFree - Promotional Toolkit
  Share BraveOriginFree everywhere with one command.

.DESCRIPTION
  This script outputs ready-to-post messages for various platforms.
  Pick your platform and copy the message.

.EXAMPLE
  .\src\promo.ps1 -Platform twitter
  .\src\promo.ps1 -Platform reddit
  .\src\promo.ps1 -Platform hackernews
  .\src\promo.ps1 -List
#>

param(
  [ValidateSet("twitter","reddit","hackernews","producthunt","facebook","linkedin","whatsapp","telegram","all")]
  [string]$Platform,
  [switch]$List
)

$RepoUrl = "https://github.com/thesajidalam/BraveOriginFree"
$ReleaseUrl = "$RepoUrl/releases"

$messages = @{
  twitter = @"
Brave Origin costs $60 on Windows. On Linux it's free.

BraveOriginFree fixes that.

Uses the official Windows Origin build + pre-sets the same activation flag that Linux uses. No modified binaries. No WSL. No $60.

⬇ $ReleaseUrl

#Brave #Privacy #OpenSource
"@

  reddit = @"
**BraveOriginFree** — Brave Origin for Windows, free (no $60 purchase)

Brave Origin is Brave's minimalist browser. On Linux it's free. On Windows it's $59.99.

BraveOriginFree uses the official Windows Origin binary (signed by Brave) but pre-configures it with `purchase_validated = true` — the exact same flag that Brave's Linux free button sets. The Windows binary reads the same Local State keys, so it activates without any payment.

**What you get:**
- Official signed Brave Origin build (untouched, verified)
- All extras disabled: Rewards, Wallet, Leo AI, News, VPN, Tor, P3A
- Portable — no install, no registry, no admin rights
- MIT License

**How to use:**
1. Download the ZIP from $ReleaseUrl
2. Extract anywhere
3. Run install.bat

That's it. 2 minutes. No $60.

$RepoUrl
"@

  hackernews = @"
BraveOriginFree - Brave Origin for Windows, free (no purchase required)

Brave Origin is Brave's stripped-down browser. On Linux it's free to use. On Windows they charge $59.99.

The bypass is surprisingly simple: Brave writes `purchase_validated = true` to a JSON config file on Linux when you click "Proceed for free". The Windows binary checks the same file. By pre-setting that value before the browser starts, Windows Origin behaves exactly like the Linux version.

No modified binaries (the exe is the official signed Brave build), no DRM circumvention. Just configuration.

$RepoUrl
"@

  producthunt = @"
BraveOriginFree - Brave Origin for Windows, Free

💰 Brave Origin costs $60 on Windows but is free on Linux.
🔧 BraveOriginFree pre-sets the same activation flag Linux uses.
✅ Official signed binary - no modifications.
📦 Portable - no install, no admin.
⭐ MIT Licensed.

⬇ $ReleaseUrl
"@

  facebook = @"
🛡️ Brave Origin for Windows — NOW FREE

Brave Origin costs $60 on Windows. On Linux it's free. BraveOriginFree fixes this by using the official Windows binary with the same activation flag that Brave uses on Linux.

✅ No $60 purchase required
✅ Official signed Brave build (not modified)
✅ No install, no admin, no registry
✅ Portable - works from USB drives

Download: $ReleaseUrl

Share with anyone who wants a clean, private browser without paying.
"@

  linkedin = @"
BraveOriginFree: Brave Origin for Windows, Free

Brave Origin is Brave's minimalist privacy browser. On Linux it's free. On Windows it costs $59.99.

BraveOriginFree is an open-source project that removes this paywall by pre-setting the same configuration that Brave provides on Linux. The browser binary is the official signed build from Brave — unmodified and verified.

Key details:
- Uses the official Windows Origin binary
- Applies purchase_validated = true (same as Linux)
- All non-essential features disabled (Rewards, Wallet, AI, News, VPN, Tor)
- Fully portable, no installation required
- MIT License

https://github.com/thesajidalam/BraveOriginFree

#OpenSource #Privacy #Brave #Windows #FreeSoftware
"@

  whatsapp = @"
🔥 Brave Origin for Windows is now FREE!

Brave Origin costs $60 on Windows but is free on Linux. BraveOriginFree fixes that.

⬇ Download the official signed browser with free activation: $ReleaseUrl

No install. No admin. No $60. Just run install.bat.
"@

  telegram = @"
🔥 BraveOriginFree — Brave Origin for Windows, Free

Brave Origin costs $60 on Windows. On Linux it's free. This fixes that.

✅ Official signed binary
✅ Free activation (same as Linux)
✅ Portable - no install
✅ No $60

⬇ $ReleaseUrl
"@
}

if ($List) {
  Write-Host "Available platforms:" -ForegroundColor Cyan
  $messages.Keys | Sort-Object | ForEach-Object { Write-Host "  $_" -ForegroundColor Yellow }
  Write-Host ""
  Write-Host "Usage: .\src\promo.ps1 -Platform <name>" -ForegroundColor Gray
  Write-Host "       .\src\promo.ps1 -Platform all" -ForegroundColor Gray
  exit 0
}

if ($Platform -eq "all") {
  $messages.Keys | Sort-Object | ForEach-Object {
    Write-Host ""
    Write-Host ("=" * 60) -ForegroundColor Cyan
    Write-Host "  $($_.ToUpper())" -ForegroundColor Cyan
    Write-Host ("=" * 60) -ForegroundColor Cyan
    Write-Host ""
    Write-Host $messages[$_] -ForegroundColor White
    Write-Host ""
  }
  exit 0
}

if (-not $messages.ContainsKey($Platform)) {
  Write-Host "Unknown platform. Use -List to see available platforms." -ForegroundColor Red
  exit 1
}

Write-Host ""
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "  BraveOriginFree - Promo Message for $($Platform.ToUpper())" -ForegroundColor Cyan
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host ""
Write-Host $messages[$Platform] -ForegroundColor White
Write-Host ""
Write-Host ("=" * 60) -ForegroundColor Gray
Write-Host "Copy the message above and post it on $Platform" -ForegroundColor Yellow
Write-Host ("=" * 60) -ForegroundColor Gray
