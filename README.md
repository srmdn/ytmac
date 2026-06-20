# dlmac

macOS CLI wrapper for [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [ffmpeg](https://ffmpeg.org). Download online media and extract audio from local video files.

## Requirements

- macOS
- [Homebrew](https://brew.sh)
- yt-dlp
- ffmpeg

## Installation

```bash
git clone https://github.com/srmdn/dlmac.git
cd dlmac
./install.sh
```

`install.sh` checks dependencies and offers to install missing ones via Homebrew.

## Usage

```
dlmac info <url>                    Show video metadata
dlmac formats <url>                 Show available formats
dlmac video <url>                   Download best video (mp4)
dlmac video <url> --quality 720p    Download best video up to 720p
dlmac video <url> --quality 1080p   Download best video up to 1080p
dlmac audio <url>                   Download best audio (mp3)
dlmac audio <url> --format mp3      Download audio as mp3
dlmac audio <url> --format m4a      Download audio as m4a
dlmac audio <url> --format wav      Download audio as wav
dlmac convert <file> --to mp3       Extract audio from video to mp3
dlmac convert <file> --to m4a       Extract audio from video to m4a
dlmac convert <file> --to wav       Extract audio from video to wav
```

All downloads saved to `./downloads/`.

## Examples

```bash
# Get video info
./dlmac info "https://www.youtube.com/watch?v=..."

# Download video at 720p
./dlmac video "https://www.youtube.com/watch?v=..." --quality 720p

# Download audio as mp3
./dlmac audio "https://www.youtube.com/watch?v=..." --format mp3

# Extract audio from local video
./dlmac convert myvideo.mp4 --to mp3
```

## Limitations (v0.1)

- macOS only
- No playlist support
- No interactive format selector
- No login/cookie support
- Quality depends on source video availability; falls back to best available below requested

## Legal Notice

This tool is for local use with content you own, have permission to download, or that is legally available. It does **not** bypass DRM, paywalls, private content, or access restrictions.

Users are responsible for respecting copyright, platform terms of service, and applicable laws.

## License

GPL-3.0-or-later
