<!-- Begin Main Menu -->
<?php $RootMenu = new cMenu(EW_MENUBAR_ID) ?>
<?php

// Generate all menu items
$RootMenu->IsRoot = TRUE;
$RootMenu->AddMenuItem(12, "mi_cf01_home_php", $Language->MenuPhrase("12", "MenuText"), "cf01_home.php", -1, "", AllowListMenu('{1F4EE816-E057-4A7E-9024-5EA4446B7598}cf01_home.php'), FALSE, TRUE);
$RootMenu->AddMenuItem(3, "mi_t03_pinjaman", $Language->MenuPhrase("3", "MenuText"), "t03_pinjamanlist.php", -1, "", AllowListMenu('{1F4EE816-E057-4A7E-9024-5EA4446B7598}t03_pinjaman'), FALSE, FALSE);
$RootMenu->AddMenuItem(14, "mci_Setup", $Language->MenuPhrase("14", "MenuText"), "", -1, "", IsLoggedIn(), FALSE, TRUE);
$RootMenu->AddMenuItem(1, "mi_t01_nasabah", $Language->MenuPhrase("1", "MenuText"), "t01_nasabahlist.php", 14, "", AllowListMenu('{1F4EE816-E057-4A7E-9024-5EA4446B7598}t01_nasabah'), FALSE, FALSE);
$RootMenu->AddMenuItem(7, "mi_t94_log", $Language->MenuPhrase("7", "MenuText"), "t94_loglist.php", -1, "", AllowListMenu('{1F4EE816-E057-4A7E-9024-5EA4446B7598}t94_log'), FALSE, FALSE);
$RootMenu->AddMenuItem(8, "mi_t95_logdesc", $Language->MenuPhrase("8", "MenuText"), "t95_logdesclist.php", -1, "", AllowListMenu('{1F4EE816-E057-4A7E-9024-5EA4446B7598}t95_logdesc'), FALSE, FALSE);
$RootMenu->AddMenuItem(9, "mi_t96_employees", $Language->MenuPhrase("9", "MenuText"), "t96_employeeslist.php", -1, "", AllowListMenu('{1F4EE816-E057-4A7E-9024-5EA4446B7598}t96_employees'), FALSE, FALSE);
$RootMenu->AddMenuItem(10, "mi_t97_userlevels", $Language->MenuPhrase("10", "MenuText"), "t97_userlevelslist.php", -1, "", (@$_SESSION[EW_SESSION_USER_LEVEL] & EW_ALLOW_ADMIN) == EW_ALLOW_ADMIN, FALSE, FALSE);
$RootMenu->AddMenuItem(11, "mi_t98_userlevelpermissions", $Language->MenuPhrase("11", "MenuText"), "t98_userlevelpermissionslist.php", -1, "", (@$_SESSION[EW_SESSION_USER_LEVEL] & EW_ALLOW_ADMIN) == EW_ALLOW_ADMIN, FALSE, FALSE);
$RootMenu->AddMenuItem(13, "mi_t99_audittrail", $Language->MenuPhrase("13", "MenuText"), "t99_audittraillist.php", -1, "", AllowListMenu('{1F4EE816-E057-4A7E-9024-5EA4446B7598}t99_audittrail'), FALSE, FALSE);
$RootMenu->AddMenuItem(-2, "mi_changepwd", $Language->Phrase("ChangePwd"), "changepwd.php", -1, "", IsLoggedIn() && !IsSysAdmin());
$RootMenu->AddMenuItem(-1, "mi_logout", $Language->Phrase("Logout"), "logout.php", -1, "", IsLoggedIn());
$RootMenu->AddMenuItem(-1, "mi_login", $Language->Phrase("Login"), "login.php", -1, "", !IsLoggedIn() && substr(@$_SERVER["URL"], -1 * strlen("login.php")) <> "login.php");
$RootMenu->Render();
?>
<!-- End Main Menu -->
