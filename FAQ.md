# ❓ Frequently Asked Questions (FAQ)

### 🔧 Driver installation fails

There are several common reasons for driver installation issues:

1. **Incompatible kernel version**
   - Linuwu Sense drivers require **Linux kernel 6.13 or later**. If you're running an older kernel, the installation will fail. Please update your kernel before proceeding.

2. **Secure Boot is enabled**
   - Secure Boot prevents unsigned kernel modules from loading. This can cause errors like:

      ```
      modprobe: ERROR: could not insert 'linuwu_sense': Key was rejected by service
      make: Error 1
      ```

   - **Temporary Solution**: Disable Secure Boot in your BIOS/UEFI settings and try installing again.

3. **Installation path contains spaces**
   - If the installation directory contains spaces (e.g., `Acer Sense/setup.sh`), the install script may fail.
   **Solution**: Move or rename the directory so it has **no spaces in the path**.

---

### 🧩 GUI is empty or showing "Unknown Model" (Even though your model is supported)

This is usually caused by model detection issues:

* **Acer firmware quirks**: Some Acer devices behave inconsistently during hardware detection.
  **Try restarting your laptop** or **reinstalling the drivers**.

* ~~**Distro Compatibility Issues**:
  The DAMX project is officially tested and supported on **Ubuntu only**. Other Linux distributions might introduce kernel or library incompatibilities, leading to missing features in the GUI.~~

---

### 🛑 It shows "Unknown Model" and my model isn’t in the Compatibility List

No worries! Your device might still be supported unofficially.

**Steps to try:**

1. Open the **Internals Manager** in the GUI.
2. Start the drivers with one of the following parameters:

   * `nitro_v4` or `predator_v4`
   * Optional: Add `enable_all` to unlock all features (RGB control, LCD override, etc.)
3. If this works, you can **make the parameter persistent** using the Internals Manager.

Want native support?

* Head over to my [Linuwu Sense](https://github.com/kleqing/Linuwu-Sense) project and **submit your device’s quirk configuration in the driver itself** to help others in the community.

---

### 🛠️ I want to add support for my own model – How?

- **Fork and modify the Linuwu Sense**

   * This driver is a forked version from [PXDiv](https://github.com/PXDiv/Div-Linuwu-Sense) but I added more supported for most model (from PRs)
   * Submit your config via a pull request
   * Active and regularly updated, unlike the upstream project
  
- The original developer of `linuwu-sense` seems to be busy and has very less time. Even the author of `DAMX` was on that situation too. So that I forked their project and added more quirk to support more device. Note that all of the quirk I added has been comfirmed to work by the community.

---

### 🤔 How do I write the quirk configuration in the driver itself to get native support?

Here's a user-friendly process to add support for a new Acer laptop model to the `linuwu_sense.c` driver:

### Step-by-Step Guide to Add a New Model Quirk

1. **Identify your laptop model**
   - Run `sudo dmidecode -s system-product-name` in terminal to get your exact model name
   - Note down any special features your model has (RGB keyboard, special cooling system, etc.)

2. **Open the driver config in a text editor**
   - Open the `linuwu_sense.c` located in the AcerSense directory where you run the `setup.sh` (Default directory is `/AcerSense/Linuwu-Sense/src/linuwu_sense.c`)
   - If you think the driver is out of date, you can clone the project at [here](https://github.com/kleqing/Linuwu-Sense). Make sure that you have to extract and replace the `Linuwu-Sense` folder in the AcerSense directory.

3. **Check existing quirks**
   - Look through the existing quirk entries in the file (search for `quirk_acer_` to find them)
   - Find one that matches your laptop's capabilities as closely as possible

4. **Create your quirk entry**
   - Add a new entry in the quirks section following this format:

     ```c
     static struct quirk_entry quirk_acer_YOUR_MODEL = {
         .predator_v4 = 1,             // If uses Predator Sense v4
         .nitro_v4 = 1,                // If uses Nitro Sense v4
         .nitro_sense = 1,             // If it does not support LCD Override and Boot Animation Sound, use nitro_sense
         .four_zone_kb = 1             // If has 4-zone RGB keyboard
      
         //special quirks (only add these if you know what you are doing and your hardware supports it)
         .wireless = 1,                // If has special wireless handling
         .brightness = -1,              // If has brightness control
         .turbo = 1,                   // If has turbo mode (turbo mode is detected by driver itself, you don't explicitly need to enable it, is only needed in specific scenarios and models)
         .cpu_fans = 1,                // Number of CPU fans
         .gpu_fans = 1,                // Number of GPU fans
     };
     ```

5. **Add DMI to match entry**
   - Add your model to the `acer_quirks` array:

     ```c
     {
         .callback = dmi_matched,
         .ident = "Acer Your Model Name",
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
             DMI_MATCH(DMI_PRODUCT_NAME, "YOUR EXACT MODEL NAME"),
         },
         .driver_data = &quirk_acer_YOUR_MODEL,
     },
     ```

6. **Test your changes**

   - Save the files and its changes in the DAMX's Linuwu Sense Directory

   - Reinstall AcerSense (run `./setup.sh` and choose option 4, it will automatically reinstall the driver):

   - Check dmesg for errors:
     ```bash
     dmesg
     ```
   - Check AcerSense for all the features you wanted:
     

7. **Submit your changes**

   - Fork [this](https://github.com/kleqing/Linuwu-Sense/fork) GitHub repository
   - Create a branch for your changes
   - Commit your changes with a descriptive message
   - Create a pull request to the original repository

### Example for a new model 

*If your model does not require much config and does not have special features like Four zone RGB kayboard you can just add:*

```c
/* Add to acer_quirks array (Starting around line 680, if you don't see, just scroll down a bit): */

{
   .callback = dmi_matched,
   .ident = "Acer Nitro ANV15-51",
   .matches = {
         DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
         DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
   },
      .driver_data = &quirk_acer_nitro, //This line here tells which quirk list (struct) to use, since we want the default nitro_sense quirk, it'll initialize with just the default config 
},
```

This will just enable the base quirk with defaults of nitro_sense

Here are the default structs:
- For predator_v4 use `.driver_data =  &quirk_acer_predator_v4` // Enables Base Predator_v4, use in predator models. <br>
- For nitro_v4 use `.driver_data =  &quirk_acer_nitro_v4` // Enables Base Nitro_v4, use in nitro models. <br>
- For nitro_sense use `.driver_data = &quirk_acer_nitro` //Used in nitro models without special features like lcd override and boot sound (like ANV15-51). <br>


*For an "Acer Nitro 5 AN515-45" with all features:*

```c
static struct quirk_entry quirk_acer_nitro_an515_45 = {
   .nitro_v4 = 1,
   .four_zone_kb = 1,
};

/* Then add to acer_quirks array: */
{
   .callback = dmi_matched,
   .ident = "Acer Nitro AN515-45",
   .matches = {
      DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
      DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-45"),
   },
   .driver_data = &quirk_acer_nitro_an515_45,
},
```

*For an "Acer Predator PHN16-73" with all special features:*

```c
static struct quirk_entry quirk_acer_predator_phn16_73 = {
    .turbo = 1,
    .cpu_fans = 1,
    .gpu_fans = 1,
    .predator_v4 = 1,
    .four_zone_kb = 1
};

/* Then add to acer_quirks array: */
{
   .callback = dmi_matched,
   .ident = "Acer Predator PHN16-73",
   .matches = {
      DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
      DMI_MATCH(DMI_PRODUCT_NAME, "Predator PHN16-73"),
   },
   .driver_data = &quirk_acer_predator_phn16_73,
},
```

### Troubleshooting Tips

1. If features don't work:
   - Try enabling `enable_all=1` parameter when loading the module to test all capabilities
   - Check kernel logs with `dmesg` for clues

2. If your model isn't detected:
   - Double-check the exact product name in DMI
   - Try wildcards if the name varies slightly between regions

3. For RGB keyboard issues:
   - Ensure `four_zone_kb = 1` is set
   - Check if your keyboard responds to the existing RGB controls

Remember to always keep a backup of your working kernel/driver before making changes!

---

Have more questions or need help?
- 👉 Feel free to [open an issue](#issues) or join the discussions.

## ❤️ Credit

- All the original credit of this FAQ page is belongs to [PXDiv](https://github.com/PXDiv)