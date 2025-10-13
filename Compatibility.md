# Compatiblitiy List
If your device isn’t listed in the compatibility table — don’t worry! You can still download and try AcerSense. If your laptop is compatible, it may work out of the box. If not, you can add support by creating a custom configuration for your system.

AcerSense is primarily built for modern Acer laptops (2019 and newer) that use WMI protocols.

✅ Officially tested distributions: Ubuntu 25+, Kubuntu 25+ and Arch Linux

✅ Minimum required kernel version: Linux 6.13+

> Note: This compatibility list simply reflects devices where the my Linuwu drivers has been modified to work with.
>
> If your Acer laptop is not listed but works correctly or partially with AcerSense, please help improve the project by filing an issue with your model details — so others can benefit from your discovery.
>
> You can find original compatibility list at [here](https://github.com/PXDiv/Div-Acer-Manager-Max/blob/main/Compatibility.md). This is the modified version to matched with my [Linuwu-Sense](https://github.com/kleqing/Linuwu-Sense/tree/main).
>

Please also check out the [FAQ Page](https://github.com/PXDiv/Div-Acer-Manager-Max/blob/main/FAQ.md) to know how to get your model to work even though it's not supported, and you can even help others by creating a quirk config and for your model and creating a merge request. 

If your model is supported without quirk, you can create a [PRs](https://github.com/kleqing/AcerSense/pulls) to help others known that the model is compatible with AcerSense. If your model is not supported even after install the Linuwu-Sense. You can read [this page](https://github.com/kleqing/Acer-Sense?tab=readme-ov-file#-i-want-to-add-support-for-my-own-model-) to learn how to create a dmi quirk for your model.


| Model               | Status                 | Notes                                                            |
| ------------------- | ---------------------- | ---------------------------------------------------------------- |
| **ANV15-51**        | ✅ Supported      | **Officially tested and verified by the author.**                     |
| ANV15-41            | ✅ Supported            | Stable with all features working.                                |
| AN16-41             | ✅ Supported            | Fully functional on supported kernels.                           |
| AN16-42             | ✅ Supported            | Need to force parameters <br> using Internals Manager (`nitro_v4`) |
| AN16-43             | ✅ Supported            | Fully functional on supported kernels.                           |
| **PHN16-71**        | ✅ Supported |  Per key keyboard lighting maybe not working properly.                 |
| PHN16-72            | ✅ Supported            | Uses same quirk profile as PHN16-71 but no known lighting issue. |
| PH16-71             | ✅ Supported            | Uses universal Predator V4 quirk.                                |
| PH18-71             | ✅ Supported            | Uses universal Predator V4 quirk.                                |
| PH315-52            | ✅ Supported            | Uses universal Predator V4 quirk.                              |
| PH315-53            | ✅ Supported            | Known stable, uses dedicated quirk.                              |
| PH315-54            | ✅ Supported            | Uses universal Predator V4 quirk.                              |
| AN515-44            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) |
| AN515-45            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) |
| AN515-46            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) |
| AN515-47            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) |
| AN515-54            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) <br> **Has 3 brightness level.** <br> **No 4 zone keyboard backlight.** |
| AN515-55            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) |
| AN515-57            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) <br> **No 4 zone keyboard backlight.** |
| AN515-58            | ✅ Supported | Has Inbuilt support, <br> To use LCD Override use `nitro_v4` parameter |
| AN517-54            | ✅ Supported | Need to force parameters <br> using Internals Manager (`nitro_v4`) |
| AN517-55            | ⚪ Not Yet Verified     | No reports yet — hardware support unconfirmed.                   |
| Aspire 1360         | ✅ Supported            | Legacy model — uses Aspire 1520 quirk.                           |
| Aspire 1520         | ✅ Supported            | Legacy model — uses Aspire 1520 quirk.                           |
| Aspire 3100         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Aspire 3610         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Aspire 5100         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Aspire 5610         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Aspire 5630         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Aspire 5650         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Aspire 5680         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Aspire 9110         | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| TravelMate 2490     | ✅ Supported            | Native support.                                                  |
| TravelMate 4200     | ✅ Supported            | Uses TravelMate 2490 quirk.                                      |
| Switch 10 E SW3-016 | ✅ Supported            | Keyboard dock support via force caps.                            |
| Switch 10 SW5-012   | ✅ Supported            | Keyboard dock support via force caps.                            |
| Switch V 10 SW5-017 | ✅ Supported            | Keyboard dock support via force caps.                            |
| One 10 (S1003)      | ✅ Supported            | Keyboard dock support via force caps.                            |

## Credit

- All the original credit of this Compatibility page is belongs to [PXDiv](https://github.com/PXDiv)