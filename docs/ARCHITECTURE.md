# Blueberry architecture

## Principle

Use mature Linux infrastructure for kernel, drivers, services, and package management. Put Blueberry-specific engineering into the desktop experience, applications, branding, defaults, and installer flow.

## Layers

1. **Distribution base** — Debian Stable, APT, Linux kernel, firmware, and upstream security updates.
2. **System services** — systemd, NetworkManager, PipeWire, and standard Linux service interfaces.
3. **Display and window management** — Wayland and KWin initially. Avoid writing a compositor until there is a clear requirement.
4. **Blueberry shell** — Qt 6 / QML components for the panel, launcher, notifications, quick settings, and desktop widgets.
5. **Native apps** — settings, file manager, terminal, system monitor, and application management, added one at a time.
6. **Image and installer** — Debian live-build configuration and a graphical installer once the desktop is usable.

## Desktop integration strategy

The first shell prototype is a normal application and must not assume it owns the whole display. This keeps iteration safe and makes it possible to develop on an existing Linux installation.

Next, split the shell into independent components and provide configuration for theme, panel, launcher, and wallpaper. Package the shell and its session entry only after the core interaction model is stable.

KWin remains the window manager in the early stages. Blueberry should integrate with standard Wayland protocols and desktop interfaces rather than depending on private compositor behavior where avoidable.

## Build stages

### Stage 0 — runnable prototype
- Establish the visual language.
- Make the shell compile and launch using Qt 6.
- Keep all mock application actions clearly identified as prototype behavior.

### Stage 1 — functional shell
- Real application launching through desktop entries.
- Clock, audio, network, and power status using supported system interfaces.
- Notifications and keyboard navigation.
- User-configurable appearance and wallpaper.

### Stage 2 — desktop session
- Session entry and startup integration.
- Consistent theme, icons, fonts, and default applications.
- Clean logout, restart, and shutdown integration.

### Stage 3 — Linux image
- Reproducible Debian live image.
- Blueberry defaults and packages.
- Virtual-machine boot and install tests.
- Calamares integration only after the live session is reliable.

## Safety and reliability

- Do not run the shell as root.
- Do not edit host system configuration during ordinary shell development.
- Keep packaging and image creation in separate scripts.
- Prefer upstream security updates over maintaining a private kernel fork.
- Test the live image in a disposable VM before recommending installation on real hardware.
