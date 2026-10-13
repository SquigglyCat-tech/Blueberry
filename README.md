# Blueberry OS

**An original Linux-based operating system with its own desktop identity.**

Blueberry is a new project, separate from RockOS. The plan is to build a practical Linux distribution first, then develop a distinctive desktop shell and native utilities around it.

> **Project status:** early development. The current shell is a UI prototype, not a complete desktop environment or bootable ISO.

## Direction

- **Base:** Debian Stable, using the Linux kernel and existing hardware drivers.
- **Window management:** KWin initially, so we can focus on the Blueberry experience instead of writing a compositor first.
- **UI technology:** Qt 6 / QML for the custom shell and native applications.
- **Installer:** Calamares is the initial candidate once the live image is established.
- **Testing:** develop the shell on a normal Linux desktop first; add repeatable ISO builds and VM testing as the project matures.

## First milestones

1. Establish the design language and runnable shell prototype.
2. Build the panel, launcher, notifications, and settings into useful desktop components.
3. Package the shell as a desktop session.
4. Assemble a Debian-based live image with Blueberry branding.
5. Add an installer, first-run setup, and release checks.

## Repository layout

- `desktop/shell/` — Qt 6 / QML shell prototype.
- `docs/ARCHITECTURE.md` — system boundaries and development plan.
- `branding/` — future logos, wallpapers, icons, and theme assets.
- `scripts/` — future build and validation helpers.
- `distro/` — future live-image and installer configuration.

## Run the shell prototype

Requirements: CMake 3.21+, a C++ compiler, Qt 6.5+ with Quick and QML modules.

```sh
cmake -S desktop/shell -B build/shell
cmake --build build/shell
./build/shell/blueberry-shell
```

On Windows, the executable is normally `build/shell/Debug/blueberry-shell.exe` or `build/shell/Release/blueberry-shell.exe`, depending on the generator.

The prototype can run as a regular window while developing. It does not yet replace the host desktop or boot as an operating system.

## Contributions and project approach

Blueberry is being developed incrementally: keep the base system dependable, keep the custom shell modular, and make every milestone runnable before expanding it.
