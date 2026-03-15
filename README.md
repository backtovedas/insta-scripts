# insta-ready

Bash script to optimize high-res video (like 4K60fps) for Instagram Stories. Forces 1080x1920, 30fps, and a 5Mbps bitrate ceiling to prevent aggressive server-side compression.

## dependencies

```bash
ffmpeg --help
```

## usage

Make it executable:
```bash
chmod +x story.sh
```

Run it:
```bash
./story <input_video.mp4>
```



