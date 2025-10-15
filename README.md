<p align="center">
  <img src="https://raw.githubusercontent.com/kleqing/AcerSense/refs/heads/main/AcerSense/icon.png" alt="icon" width="80" style="vertical-align: middle;">
</p>

<h1 align="center">
  AcerSense
</h1>

**AcerSense** is the ***reworked*** version of the original [DAMX](https://github.com/PXDiv/Div-Acer-Manager-Max) by PXDiv, which is a Linux GUI for Acer laptops using Linuwu Sense drivers — all wrapped in a modern Avalonia-based UI. This is a replicates of NitroSense and PredatorSense but for Linux!

> [!CAUTION]
> The project will be development more if there was a huge changed with the origin branch

![Image](https://github.com/user-attachments/assets/d684c630-5b0a-482e-acea-0b3933987312)

<h4 align="center" style="font-style: italic">
 The forked version of <a href="https://github.com/PXDiv/Div-Acer-Manager-Max">DAMX</a> with better UI
</h4>  

## ❓ Why "Rework"

- Uh,... It is just my sudden inspiration. After finding a lot of 'NitroSense for Linux' in the internet, I found that every tools/drivers are not supported for my model. Even I edited the [linuwu_sense](https://github.com/0x7375646F/Linuwu-Sense/blob/main/src/linuwu_sense.c) to make the DMI matched with my device, Linuwu Sense still not supported my device. After read the README, I found that a GUI tool called DAMX that can supported my device by edit the modified version of [linuwu_sense](https://github.com/PXDiv/Div-Linuwu-Sense) (PXDiv). But the UI is too bad for me so I fork his project and modify a bit.

## ✨ Features

***All the original features of the DAMX are still here. My version is just modify the UI to make it look better!***

- 🔋 **Performance / Thermal Profiles**
  - Eco, Silent, Balanced, Performance, Turbo — automatically adjusted based on AC/battery status
  (e.g., Turbo hidden when on battery or unsupported). **Only Nitro V (not 5) and Predator has this feature**

- 🌡 **Fan Control**
  - Manual and auto fan speed modes
  - Manual disabled automatically when in Quiet profile

- 💡 **LCD Override Setting**
  - Direct control over LCD power behavior

- 🎨 **Keyboard Backlight Control**
  - Customize the keyboard backlight timeout
  - Auto set keyboard backlight brightness slider based on the [acer-wmi](https://github.com/torvalds/linux/blob/master/drivers/platform/x86/acer-wmi.c) output

- 🔊 **Boot Animation and Sound Toggle**
  - Enable/disable Acer's startup animations and sounds

- 💻 **Live System Info Display**
  - Shows real-time performance profile, fan settings, calibration state, and more

- 🧠 **Smart Daemon (Low Resource Use)**
  - Auto-detects feature support per device
  - Communicates with GUI in real-time
  - Lightweight: consume less RAM
  - Can run **independently** of GUI
  - Recursive restart to fix software issues similar to those on Windows

- 🖥️ **Modern GUI**
  - Avalonia-based, clean and responsive
  - Realtime Monitoring with Dashboard and accurate Tempreature Readings
  - Dynamic UI hides unsupported features
  - Real-time feedback from daemon

## 🧭 Compatibilty
Please check the compatibility at here: [Compatibility List](https://github.com/kleqing/AcerSense/blob/main/Compatibility.md)

> Note that the compatibility list may be out date if using this version because it comes with my custom linuwu-sense driver, not from the author!

## 🖥️ DAMX Installation Guide

1. Download the latest release from the **Releases** section.

2. Extract the downloaded package.

3. Make the `setup.sh` script executable:

   ```bash
   chmod +x setup.sh
   ```
  
4. Run the script:

   - Right-click the setup file and choose **“Run in Terminal”**,
     or open a terminal in the folder and run:

     ```bash
     sudo ./setup.sh
     ```
  - If you forgot sudo, the script can automatically check if it run with sudo or not then it will notify you to type password of the root user

5. When prompted, choose an option from the menu:

   - `1` → Install
   - `2` → Install without drivers
   - `3` → Uninstall
   - `4` → Reinstall/Update
   - `5` → Check services status
   - `q` → Quit

6. Reboot your system after the installation completes.

## 🖥️ Troubleshooting

Known issues: [Increase backlight keyboard](https://github.com/kleqing/Linuwu-Sense#%EF%B8%8F-known-issue-fn--f10-keyboard-backlight-key)

You can also check the logs at /var/log/DAMX_Daemon_Log.log

If you get UNKNOWN as Laptop type, try restarting (it happens somethings). 
But if it still happenes that might mean the Drivers Installation failed, Make sure you have the approprite kernel headers to compile the drivers.

Also, check out the [FAQ page](https://github.com/kleqing/AcerSense/blob/main/FAQ.md) before opening any issues.

Please open a new issue or discussion and include the logs to get support and help the project grow if you need any info, report a bug or just give ideas for the future versions of DAMX

## ❤️ Credit

- The custom drivers for this project [Linuwu Sense](https://github.com/kleqing/Linuwu-Sense) is a forked from [Div-Linuwu Sense](https://github.com/PXDiv/Div-Linuwu-Sense) project which is built entirely on top of the [Linuwu Sense](https://github.com/0x7375646F/Linuwu-Sense) drivers — huge thanks to their developers for enabling hardware-level access on Acer laptops.
- [Gemini](https://gemini.google.com/) for the combination of the PredatorSense and NitroSense icon

## 🤝 Contributing

- Report bugs or request features via GitHub Issues
- Submit pull requests to improve code or UI
- Help test on different Acer laptop models

## 📄 License

This project is licensed under the **GNU General Public License v3.0**.  
See the [LICENSE](LICENSE) file for details.
