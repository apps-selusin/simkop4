<?php include_once "t96_employeesinfo.php" ?>
<?php

// Create page object
if (!isset($t04_pinjamanangsuran_grid)) $t04_pinjamanangsuran_grid = new ct04_pinjamanangsuran_grid();

// Page init
$t04_pinjamanangsuran_grid->Page_Init();

// Page main
$t04_pinjamanangsuran_grid->Page_Main();

// Global Page Rendering event (in userfn*.php)
Page_Rendering();

// Page Rendering event
$t04_pinjamanangsuran_grid->Page_Render();
?>
<?php if ($t04_pinjamanangsuran->Export == "") { ?>
<script type="text/javascript">

// Form object
var ft04_pinjamanangsurangrid = new ew_Form("ft04_pinjamanangsurangrid", "grid");
ft04_pinjamanangsurangrid.FormKeyCountName = '<?php echo $t04_pinjamanangsuran_grid->FormKeyCountName ?>';

// Validate form
ft04_pinjamanangsurangrid.Validate = function() {
	if (!this.ValidateRequired)
		return true; // Ignore validation
	var $ = jQuery, fobj = this.GetForm(), $fobj = $(fobj);
	if ($fobj.find("#a_confirm").val() == "F")
		return true;
	var elm, felm, uelm, addcnt = 0;
	var $k = $fobj.find("#" + this.FormKeyCountName); // Get key_count
	var rowcnt = ($k[0]) ? parseInt($k.val(), 10) : 1;
	var startcnt = (rowcnt == 0) ? 0 : 1; // Check rowcnt == 0 => Inline-Add
	var gridinsert = $fobj.find("#a_list").val() == "gridinsert";
	for (var i = startcnt; i <= rowcnt; i++) {
		var infix = ($k[0]) ? String(i) : "";
		$fobj.data("rowindex", infix);
		var checkrow = (gridinsert) ? !this.EmptyRow(infix) : true;
		if (checkrow) {
			addcnt++;
			elm = this.GetElements("x" + infix + "_pinjaman_id");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t04_pinjamanangsuran->pinjaman_id->FldCaption(), $t04_pinjamanangsuran->pinjaman_id->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_pinjaman_id");
			if (elm && !ew_CheckInteger(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->pinjaman_id->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Ke");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t04_pinjamanangsuran->Angsuran_Ke->FldCaption(), $t04_pinjamanangsuran->Angsuran_Ke->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Ke");
			if (elm && !ew_CheckInteger(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Angsuran_Ke->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Tanggal");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t04_pinjamanangsuran->Angsuran_Tanggal->FldCaption(), $t04_pinjamanangsuran->Angsuran_Tanggal->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Tanggal");
			if (elm && !ew_CheckDateDef(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Angsuran_Tanggal->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Pokok");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t04_pinjamanangsuran->Angsuran_Pokok->FldCaption(), $t04_pinjamanangsuran->Angsuran_Pokok->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Pokok");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Angsuran_Pokok->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Bunga");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t04_pinjamanangsuran->Angsuran_Bunga->FldCaption(), $t04_pinjamanangsuran->Angsuran_Bunga->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Bunga");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Angsuran_Bunga->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Total");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t04_pinjamanangsuran->Angsuran_Total->FldCaption(), $t04_pinjamanangsuran->Angsuran_Total->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_Angsuran_Total");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Angsuran_Total->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Sisa_Hutang");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t04_pinjamanangsuran->Sisa_Hutang->FldCaption(), $t04_pinjamanangsuran->Sisa_Hutang->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_Sisa_Hutang");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Sisa_Hutang->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Tanggal_Bayar");
			if (elm && !ew_CheckDateDef(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Tanggal_Bayar->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Terlambat");
			if (elm && !ew_CheckInteger(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Terlambat->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Total_Denda");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Total_Denda->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Bayar_Titipan");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Bayar_Titipan->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Bayar_Non_Titipan");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Bayar_Non_Titipan->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_Bayar_Total");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->Bayar_Total->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_pinjamantitipan_id");
			if (elm && !ew_CheckInteger(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t04_pinjamanangsuran->pinjamantitipan_id->FldErrMsg()) ?>");

			// Fire Form_CustomValidate event
			if (!this.Form_CustomValidate(fobj))
				return false;
		} // End Grid Add checking
	}
	return true;
}

// Check empty row
ft04_pinjamanangsurangrid.EmptyRow = function(infix) {
	var fobj = this.Form;
	if (ew_ValueChanged(fobj, infix, "pinjaman_id", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Angsuran_Ke", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Angsuran_Tanggal", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Angsuran_Pokok", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Angsuran_Bunga", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Angsuran_Total", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Sisa_Hutang", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Tanggal_Bayar", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Terlambat", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Total_Denda", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Bayar_Titipan", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Bayar_Non_Titipan", false)) return false;
	if (ew_ValueChanged(fobj, infix, "Bayar_Total", false)) return false;
	if (ew_ValueChanged(fobj, infix, "pinjamantitipan_id", false)) return false;
	return true;
}

// Form_CustomValidate event
ft04_pinjamanangsurangrid.Form_CustomValidate = 
 function(fobj) { // DO NOT CHANGE THIS LINE!

 	// Your custom validation code here, return false if invalid. 
 	return true;
 }

// Use JavaScript validation or not
<?php if (EW_CLIENT_VALIDATE) { ?>
ft04_pinjamanangsurangrid.ValidateRequired = true;
<?php } else { ?>
ft04_pinjamanangsurangrid.ValidateRequired = false; 
<?php } ?>

// Dynamic selection lists
// Form object for search

</script>
<?php } ?>
<?php
if ($t04_pinjamanangsuran->CurrentAction == "gridadd") {
	if ($t04_pinjamanangsuran->CurrentMode == "copy") {
		$bSelectLimit = $t04_pinjamanangsuran_grid->UseSelectLimit;
		if ($bSelectLimit) {
			$t04_pinjamanangsuran_grid->TotalRecs = $t04_pinjamanangsuran->SelectRecordCount();
			$t04_pinjamanangsuran_grid->Recordset = $t04_pinjamanangsuran_grid->LoadRecordset($t04_pinjamanangsuran_grid->StartRec-1, $t04_pinjamanangsuran_grid->DisplayRecs);
		} else {
			if ($t04_pinjamanangsuran_grid->Recordset = $t04_pinjamanangsuran_grid->LoadRecordset())
				$t04_pinjamanangsuran_grid->TotalRecs = $t04_pinjamanangsuran_grid->Recordset->RecordCount();
		}
		$t04_pinjamanangsuran_grid->StartRec = 1;
		$t04_pinjamanangsuran_grid->DisplayRecs = $t04_pinjamanangsuran_grid->TotalRecs;
	} else {
		$t04_pinjamanangsuran->CurrentFilter = "0=1";
		$t04_pinjamanangsuran_grid->StartRec = 1;
		$t04_pinjamanangsuran_grid->DisplayRecs = $t04_pinjamanangsuran->GridAddRowCount;
	}
	$t04_pinjamanangsuran_grid->TotalRecs = $t04_pinjamanangsuran_grid->DisplayRecs;
	$t04_pinjamanangsuran_grid->StopRec = $t04_pinjamanangsuran_grid->DisplayRecs;
} else {
	$bSelectLimit = $t04_pinjamanangsuran_grid->UseSelectLimit;
	if ($bSelectLimit) {
		if ($t04_pinjamanangsuran_grid->TotalRecs <= 0)
			$t04_pinjamanangsuran_grid->TotalRecs = $t04_pinjamanangsuran->SelectRecordCount();
	} else {
		if (!$t04_pinjamanangsuran_grid->Recordset && ($t04_pinjamanangsuran_grid->Recordset = $t04_pinjamanangsuran_grid->LoadRecordset()))
			$t04_pinjamanangsuran_grid->TotalRecs = $t04_pinjamanangsuran_grid->Recordset->RecordCount();
	}
	$t04_pinjamanangsuran_grid->StartRec = 1;
	$t04_pinjamanangsuran_grid->DisplayRecs = $t04_pinjamanangsuran_grid->TotalRecs; // Display all records
	if ($bSelectLimit)
		$t04_pinjamanangsuran_grid->Recordset = $t04_pinjamanangsuran_grid->LoadRecordset($t04_pinjamanangsuran_grid->StartRec-1, $t04_pinjamanangsuran_grid->DisplayRecs);

	// Set no record found message
	if ($t04_pinjamanangsuran->CurrentAction == "" && $t04_pinjamanangsuran_grid->TotalRecs == 0) {
		if (!$Security->CanList())
			$t04_pinjamanangsuran_grid->setWarningMessage(ew_DeniedMsg());
		if ($t04_pinjamanangsuran_grid->SearchWhere == "0=101")
			$t04_pinjamanangsuran_grid->setWarningMessage($Language->Phrase("EnterSearchCriteria"));
		else
			$t04_pinjamanangsuran_grid->setWarningMessage($Language->Phrase("NoRecord"));
	}
}
$t04_pinjamanangsuran_grid->RenderOtherOptions();
?>
<?php $t04_pinjamanangsuran_grid->ShowPageHeader(); ?>
<?php
$t04_pinjamanangsuran_grid->ShowMessage();
?>
<?php if ($t04_pinjamanangsuran_grid->TotalRecs > 0 || $t04_pinjamanangsuran->CurrentAction <> "") { ?>
<div class="panel panel-default ewGrid t04_pinjamanangsuran">
<div id="ft04_pinjamanangsurangrid" class="ewForm form-inline">
<?php if ($t04_pinjamanangsuran_grid->ShowOtherOptions) { ?>
<div class="panel-heading ewGridUpperPanel">
<?php
	foreach ($t04_pinjamanangsuran_grid->OtherOptions as &$option)
		$option->Render("body");
?>
</div>
<div class="clearfix"></div>
<?php } ?>
<div id="gmp_t04_pinjamanangsuran" class="<?php if (ew_IsResponsiveLayout()) { echo "table-responsive "; } ?>ewGridMiddlePanel">
<table id="tbl_t04_pinjamanangsurangrid" class="table ewTable">
<?php echo $t04_pinjamanangsuran->TableCustomInnerHtml ?>
<thead><!-- Table header -->
	<tr class="ewTableHeader">
<?php

// Header row
$t04_pinjamanangsuran_grid->RowType = EW_ROWTYPE_HEADER;

// Render list options
$t04_pinjamanangsuran_grid->RenderListOptions();

// Render list options (header, left)
$t04_pinjamanangsuran_grid->ListOptions->Render("header", "left");
?>
<?php if ($t04_pinjamanangsuran->pinjaman_id->Visible) { // pinjaman_id ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->pinjaman_id) == "") { ?>
		<th data-name="pinjaman_id"><div id="elh_t04_pinjamanangsuran_pinjaman_id" class="t04_pinjamanangsuran_pinjaman_id"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->pinjaman_id->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="pinjaman_id"><div><div id="elh_t04_pinjamanangsuran_pinjaman_id" class="t04_pinjamanangsuran_pinjaman_id">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->pinjaman_id->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->pinjaman_id->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->pinjaman_id->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Angsuran_Ke->Visible) { // Angsuran_Ke ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Angsuran_Ke) == "") { ?>
		<th data-name="Angsuran_Ke"><div id="elh_t04_pinjamanangsuran_Angsuran_Ke" class="t04_pinjamanangsuran_Angsuran_Ke"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Ke->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Angsuran_Ke"><div><div id="elh_t04_pinjamanangsuran_Angsuran_Ke" class="t04_pinjamanangsuran_Angsuran_Ke">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Ke->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Angsuran_Ke->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Angsuran_Ke->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Angsuran_Tanggal->Visible) { // Angsuran_Tanggal ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Angsuran_Tanggal) == "") { ?>
		<th data-name="Angsuran_Tanggal"><div id="elh_t04_pinjamanangsuran_Angsuran_Tanggal" class="t04_pinjamanangsuran_Angsuran_Tanggal"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Angsuran_Tanggal"><div><div id="elh_t04_pinjamanangsuran_Angsuran_Tanggal" class="t04_pinjamanangsuran_Angsuran_Tanggal">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Angsuran_Tanggal->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Angsuran_Tanggal->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Angsuran_Pokok->Visible) { // Angsuran_Pokok ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Angsuran_Pokok) == "") { ?>
		<th data-name="Angsuran_Pokok"><div id="elh_t04_pinjamanangsuran_Angsuran_Pokok" class="t04_pinjamanangsuran_Angsuran_Pokok"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Pokok->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Angsuran_Pokok"><div><div id="elh_t04_pinjamanangsuran_Angsuran_Pokok" class="t04_pinjamanangsuran_Angsuran_Pokok">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Pokok->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Angsuran_Pokok->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Angsuran_Pokok->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Angsuran_Bunga->Visible) { // Angsuran_Bunga ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Angsuran_Bunga) == "") { ?>
		<th data-name="Angsuran_Bunga"><div id="elh_t04_pinjamanangsuran_Angsuran_Bunga" class="t04_pinjamanangsuran_Angsuran_Bunga"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Bunga->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Angsuran_Bunga"><div><div id="elh_t04_pinjamanangsuran_Angsuran_Bunga" class="t04_pinjamanangsuran_Angsuran_Bunga">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Bunga->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Angsuran_Bunga->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Angsuran_Bunga->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Angsuran_Total->Visible) { // Angsuran_Total ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Angsuran_Total) == "") { ?>
		<th data-name="Angsuran_Total"><div id="elh_t04_pinjamanangsuran_Angsuran_Total" class="t04_pinjamanangsuran_Angsuran_Total"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Total->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Angsuran_Total"><div><div id="elh_t04_pinjamanangsuran_Angsuran_Total" class="t04_pinjamanangsuran_Angsuran_Total">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Angsuran_Total->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Angsuran_Total->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Angsuran_Total->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Sisa_Hutang->Visible) { // Sisa_Hutang ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Sisa_Hutang) == "") { ?>
		<th data-name="Sisa_Hutang"><div id="elh_t04_pinjamanangsuran_Sisa_Hutang" class="t04_pinjamanangsuran_Sisa_Hutang"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Sisa_Hutang->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Sisa_Hutang"><div><div id="elh_t04_pinjamanangsuran_Sisa_Hutang" class="t04_pinjamanangsuran_Sisa_Hutang">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Sisa_Hutang->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Sisa_Hutang->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Sisa_Hutang->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Tanggal_Bayar->Visible) { // Tanggal_Bayar ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Tanggal_Bayar) == "") { ?>
		<th data-name="Tanggal_Bayar"><div id="elh_t04_pinjamanangsuran_Tanggal_Bayar" class="t04_pinjamanangsuran_Tanggal_Bayar"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Tanggal_Bayar->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Tanggal_Bayar"><div><div id="elh_t04_pinjamanangsuran_Tanggal_Bayar" class="t04_pinjamanangsuran_Tanggal_Bayar">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Tanggal_Bayar->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Tanggal_Bayar->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Tanggal_Bayar->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Terlambat->Visible) { // Terlambat ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Terlambat) == "") { ?>
		<th data-name="Terlambat"><div id="elh_t04_pinjamanangsuran_Terlambat" class="t04_pinjamanangsuran_Terlambat"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Terlambat->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Terlambat"><div><div id="elh_t04_pinjamanangsuran_Terlambat" class="t04_pinjamanangsuran_Terlambat">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Terlambat->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Terlambat->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Terlambat->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Total_Denda->Visible) { // Total_Denda ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Total_Denda) == "") { ?>
		<th data-name="Total_Denda"><div id="elh_t04_pinjamanangsuran_Total_Denda" class="t04_pinjamanangsuran_Total_Denda"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Total_Denda->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Total_Denda"><div><div id="elh_t04_pinjamanangsuran_Total_Denda" class="t04_pinjamanangsuran_Total_Denda">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Total_Denda->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Total_Denda->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Total_Denda->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Bayar_Titipan->Visible) { // Bayar_Titipan ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Bayar_Titipan) == "") { ?>
		<th data-name="Bayar_Titipan"><div id="elh_t04_pinjamanangsuran_Bayar_Titipan" class="t04_pinjamanangsuran_Bayar_Titipan"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Bayar_Titipan->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Bayar_Titipan"><div><div id="elh_t04_pinjamanangsuran_Bayar_Titipan" class="t04_pinjamanangsuran_Bayar_Titipan">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Bayar_Titipan->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Bayar_Titipan->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Bayar_Titipan->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Bayar_Non_Titipan->Visible) { // Bayar_Non_Titipan ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Bayar_Non_Titipan) == "") { ?>
		<th data-name="Bayar_Non_Titipan"><div id="elh_t04_pinjamanangsuran_Bayar_Non_Titipan" class="t04_pinjamanangsuran_Bayar_Non_Titipan"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Bayar_Non_Titipan"><div><div id="elh_t04_pinjamanangsuran_Bayar_Non_Titipan" class="t04_pinjamanangsuran_Bayar_Non_Titipan">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Bayar_Non_Titipan->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Bayar_Non_Titipan->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->Bayar_Total->Visible) { // Bayar_Total ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->Bayar_Total) == "") { ?>
		<th data-name="Bayar_Total"><div id="elh_t04_pinjamanangsuran_Bayar_Total" class="t04_pinjamanangsuran_Bayar_Total"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Bayar_Total->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="Bayar_Total"><div><div id="elh_t04_pinjamanangsuran_Bayar_Total" class="t04_pinjamanangsuran_Bayar_Total">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->Bayar_Total->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->Bayar_Total->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->Bayar_Total->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php if ($t04_pinjamanangsuran->pinjamantitipan_id->Visible) { // pinjamantitipan_id ?>
	<?php if ($t04_pinjamanangsuran->SortUrl($t04_pinjamanangsuran->pinjamantitipan_id) == "") { ?>
		<th data-name="pinjamantitipan_id"><div id="elh_t04_pinjamanangsuran_pinjamantitipan_id" class="t04_pinjamanangsuran_pinjamantitipan_id"><div class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->pinjamantitipan_id->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="pinjamantitipan_id"><div><div id="elh_t04_pinjamanangsuran_pinjamantitipan_id" class="t04_pinjamanangsuran_pinjamantitipan_id">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t04_pinjamanangsuran->pinjamantitipan_id->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t04_pinjamanangsuran->pinjamantitipan_id->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t04_pinjamanangsuran->pinjamantitipan_id->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php

// Render list options (header, right)
$t04_pinjamanangsuran_grid->ListOptions->Render("header", "right");
?>
	</tr>
</thead>
<tbody>
<?php
$t04_pinjamanangsuran_grid->StartRec = 1;
$t04_pinjamanangsuran_grid->StopRec = $t04_pinjamanangsuran_grid->TotalRecs; // Show all records

// Restore number of post back records
if ($objForm) {
	$objForm->Index = -1;
	if ($objForm->HasValue($t04_pinjamanangsuran_grid->FormKeyCountName) && ($t04_pinjamanangsuran->CurrentAction == "gridadd" || $t04_pinjamanangsuran->CurrentAction == "gridedit" || $t04_pinjamanangsuran->CurrentAction == "F")) {
		$t04_pinjamanangsuran_grid->KeyCount = $objForm->GetValue($t04_pinjamanangsuran_grid->FormKeyCountName);
		$t04_pinjamanangsuran_grid->StopRec = $t04_pinjamanangsuran_grid->StartRec + $t04_pinjamanangsuran_grid->KeyCount - 1;
	}
}
$t04_pinjamanangsuran_grid->RecCnt = $t04_pinjamanangsuran_grid->StartRec - 1;
if ($t04_pinjamanangsuran_grid->Recordset && !$t04_pinjamanangsuran_grid->Recordset->EOF) {
	$t04_pinjamanangsuran_grid->Recordset->MoveFirst();
	$bSelectLimit = $t04_pinjamanangsuran_grid->UseSelectLimit;
	if (!$bSelectLimit && $t04_pinjamanangsuran_grid->StartRec > 1)
		$t04_pinjamanangsuran_grid->Recordset->Move($t04_pinjamanangsuran_grid->StartRec - 1);
} elseif (!$t04_pinjamanangsuran->AllowAddDeleteRow && $t04_pinjamanangsuran_grid->StopRec == 0) {
	$t04_pinjamanangsuran_grid->StopRec = $t04_pinjamanangsuran->GridAddRowCount;
}

// Initialize aggregate
$t04_pinjamanangsuran->RowType = EW_ROWTYPE_AGGREGATEINIT;
$t04_pinjamanangsuran->ResetAttrs();
$t04_pinjamanangsuran_grid->RenderRow();
if ($t04_pinjamanangsuran->CurrentAction == "gridadd")
	$t04_pinjamanangsuran_grid->RowIndex = 0;
if ($t04_pinjamanangsuran->CurrentAction == "gridedit")
	$t04_pinjamanangsuran_grid->RowIndex = 0;
while ($t04_pinjamanangsuran_grid->RecCnt < $t04_pinjamanangsuran_grid->StopRec) {
	$t04_pinjamanangsuran_grid->RecCnt++;
	if (intval($t04_pinjamanangsuran_grid->RecCnt) >= intval($t04_pinjamanangsuran_grid->StartRec)) {
		$t04_pinjamanangsuran_grid->RowCnt++;
		if ($t04_pinjamanangsuran->CurrentAction == "gridadd" || $t04_pinjamanangsuran->CurrentAction == "gridedit" || $t04_pinjamanangsuran->CurrentAction == "F") {
			$t04_pinjamanangsuran_grid->RowIndex++;
			$objForm->Index = $t04_pinjamanangsuran_grid->RowIndex;
			if ($objForm->HasValue($t04_pinjamanangsuran_grid->FormActionName))
				$t04_pinjamanangsuran_grid->RowAction = strval($objForm->GetValue($t04_pinjamanangsuran_grid->FormActionName));
			elseif ($t04_pinjamanangsuran->CurrentAction == "gridadd")
				$t04_pinjamanangsuran_grid->RowAction = "insert";
			else
				$t04_pinjamanangsuran_grid->RowAction = "";
		}

		// Set up key count
		$t04_pinjamanangsuran_grid->KeyCount = $t04_pinjamanangsuran_grid->RowIndex;

		// Init row class and style
		$t04_pinjamanangsuran->ResetAttrs();
		$t04_pinjamanangsuran->CssClass = "";
		if ($t04_pinjamanangsuran->CurrentAction == "gridadd") {
			if ($t04_pinjamanangsuran->CurrentMode == "copy") {
				$t04_pinjamanangsuran_grid->LoadRowValues($t04_pinjamanangsuran_grid->Recordset); // Load row values
				$t04_pinjamanangsuran_grid->SetRecordKey($t04_pinjamanangsuran_grid->RowOldKey, $t04_pinjamanangsuran_grid->Recordset); // Set old record key
			} else {
				$t04_pinjamanangsuran_grid->LoadDefaultValues(); // Load default values
				$t04_pinjamanangsuran_grid->RowOldKey = ""; // Clear old key value
			}
		} else {
			$t04_pinjamanangsuran_grid->LoadRowValues($t04_pinjamanangsuran_grid->Recordset); // Load row values
		}
		$t04_pinjamanangsuran->RowType = EW_ROWTYPE_VIEW; // Render view
		if ($t04_pinjamanangsuran->CurrentAction == "gridadd") // Grid add
			$t04_pinjamanangsuran->RowType = EW_ROWTYPE_ADD; // Render add
		if ($t04_pinjamanangsuran->CurrentAction == "gridadd" && $t04_pinjamanangsuran->EventCancelled && !$objForm->HasValue("k_blankrow")) // Insert failed
			$t04_pinjamanangsuran_grid->RestoreCurrentRowFormValues($t04_pinjamanangsuran_grid->RowIndex); // Restore form values
		if ($t04_pinjamanangsuran->CurrentAction == "gridedit") { // Grid edit
			if ($t04_pinjamanangsuran->EventCancelled) {
				$t04_pinjamanangsuran_grid->RestoreCurrentRowFormValues($t04_pinjamanangsuran_grid->RowIndex); // Restore form values
			}
			if ($t04_pinjamanangsuran_grid->RowAction == "insert")
				$t04_pinjamanangsuran->RowType = EW_ROWTYPE_ADD; // Render add
			else
				$t04_pinjamanangsuran->RowType = EW_ROWTYPE_EDIT; // Render edit
		}
		if ($t04_pinjamanangsuran->CurrentAction == "gridedit" && ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT || $t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) && $t04_pinjamanangsuran->EventCancelled) // Update failed
			$t04_pinjamanangsuran_grid->RestoreCurrentRowFormValues($t04_pinjamanangsuran_grid->RowIndex); // Restore form values
		if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) // Edit row
			$t04_pinjamanangsuran_grid->EditRowCnt++;
		if ($t04_pinjamanangsuran->CurrentAction == "F") // Confirm row
			$t04_pinjamanangsuran_grid->RestoreCurrentRowFormValues($t04_pinjamanangsuran_grid->RowIndex); // Restore form values

		// Set up row id / data-rowindex
		$t04_pinjamanangsuran->RowAttrs = array_merge($t04_pinjamanangsuran->RowAttrs, array('data-rowindex'=>$t04_pinjamanangsuran_grid->RowCnt, 'id'=>'r' . $t04_pinjamanangsuran_grid->RowCnt . '_t04_pinjamanangsuran', 'data-rowtype'=>$t04_pinjamanangsuran->RowType));

		// Render row
		$t04_pinjamanangsuran_grid->RenderRow();

		// Render list options
		$t04_pinjamanangsuran_grid->RenderListOptions();

		// Skip delete row / empty row for confirm page
		if ($t04_pinjamanangsuran_grid->RowAction <> "delete" && $t04_pinjamanangsuran_grid->RowAction <> "insertdelete" && !($t04_pinjamanangsuran_grid->RowAction == "insert" && $t04_pinjamanangsuran->CurrentAction == "F" && $t04_pinjamanangsuran_grid->EmptyRow())) {
?>
	<tr<?php echo $t04_pinjamanangsuran->RowAttributes() ?>>
<?php

// Render list options (body, left)
$t04_pinjamanangsuran_grid->ListOptions->Render("body", "left", $t04_pinjamanangsuran_grid->RowCnt);
?>
	<?php if ($t04_pinjamanangsuran->pinjaman_id->Visible) { // pinjaman_id ?>
		<td data-name="pinjaman_id"<?php echo $t04_pinjamanangsuran->pinjaman_id->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<?php if ($t04_pinjamanangsuran->pinjaman_id->getSessionValue() <> "") { ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjaman_id" class="form-group t04_pinjamanangsuran_pinjaman_id">
<span<?php echo $t04_pinjamanangsuran->pinjaman_id->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->pinjaman_id->ViewValue ?></p></span>
</span>
<input type="hidden" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->CurrentValue) ?>">
<?php } else { ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjaman_id" class="form-group t04_pinjamanangsuran_pinjaman_id">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->pinjaman_id->EditValue ?>"<?php echo $t04_pinjamanangsuran->pinjaman_id->EditAttributes() ?>>
</span>
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<?php if ($t04_pinjamanangsuran->pinjaman_id->getSessionValue() <> "") { ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjaman_id" class="form-group t04_pinjamanangsuran_pinjaman_id">
<span<?php echo $t04_pinjamanangsuran->pinjaman_id->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->pinjaman_id->ViewValue ?></p></span>
</span>
<input type="hidden" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->CurrentValue) ?>">
<?php } else { ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjaman_id" class="form-group t04_pinjamanangsuran_pinjaman_id">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->pinjaman_id->EditValue ?>"<?php echo $t04_pinjamanangsuran->pinjaman_id->EditAttributes() ?>>
</span>
<?php } ?>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjaman_id" class="t04_pinjamanangsuran_pinjaman_id">
<span<?php echo $t04_pinjamanangsuran->pinjaman_id->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->pinjaman_id->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->OldValue) ?>">
<?php } ?>
<?php } ?>
<a id="<?php echo $t04_pinjamanangsuran_grid->PageObjName . "_row_" . $t04_pinjamanangsuran_grid->RowCnt ?>"></a></td>
	<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->id->CurrentValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_id" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_id" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->id->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT || $t04_pinjamanangsuran->CurrentMode == "edit") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->id->CurrentValue) ?>">
<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Ke->Visible) { // Angsuran_Ke ?>
		<td data-name="Angsuran_Ke"<?php echo $t04_pinjamanangsuran->Angsuran_Ke->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Ke" class="form-group t04_pinjamanangsuran_Angsuran_Ke">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Ke->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Ke->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Ke" class="form-group t04_pinjamanangsuran_Angsuran_Ke">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Ke->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Ke->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Ke" class="t04_pinjamanangsuran_Angsuran_Ke">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Ke->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Angsuran_Ke->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Tanggal->Visible) { // Angsuran_Tanggal ?>
		<td data-name="Angsuran_Tanggal"<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Tanggal" class="form-group t04_pinjamanangsuran_Angsuran_Tanggal">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Tanggal" class="form-group t04_pinjamanangsuran_Angsuran_Tanggal">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Tanggal" class="t04_pinjamanangsuran_Angsuran_Tanggal">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Pokok->Visible) { // Angsuran_Pokok ?>
		<td data-name="Angsuran_Pokok"<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Pokok" class="form-group t04_pinjamanangsuran_Angsuran_Pokok">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Pokok" class="form-group t04_pinjamanangsuran_Angsuran_Pokok">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Pokok" class="t04_pinjamanangsuran_Angsuran_Pokok">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Bunga->Visible) { // Angsuran_Bunga ?>
		<td data-name="Angsuran_Bunga"<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Bunga" class="form-group t04_pinjamanangsuran_Angsuran_Bunga">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Bunga" class="form-group t04_pinjamanangsuran_Angsuran_Bunga">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Bunga" class="t04_pinjamanangsuran_Angsuran_Bunga">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Total->Visible) { // Angsuran_Total ?>
		<td data-name="Angsuran_Total"<?php echo $t04_pinjamanangsuran->Angsuran_Total->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Total" class="form-group t04_pinjamanangsuran_Angsuran_Total">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Total->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Total->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Total" class="form-group t04_pinjamanangsuran_Angsuran_Total">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Total->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Total->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Angsuran_Total" class="t04_pinjamanangsuran_Angsuran_Total">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Total->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Angsuran_Total->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Sisa_Hutang->Visible) { // Sisa_Hutang ?>
		<td data-name="Sisa_Hutang"<?php echo $t04_pinjamanangsuran->Sisa_Hutang->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Sisa_Hutang" class="form-group t04_pinjamanangsuran_Sisa_Hutang">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Sisa_Hutang->EditValue ?>"<?php echo $t04_pinjamanangsuran->Sisa_Hutang->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Sisa_Hutang" class="form-group t04_pinjamanangsuran_Sisa_Hutang">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Sisa_Hutang->EditValue ?>"<?php echo $t04_pinjamanangsuran->Sisa_Hutang->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Sisa_Hutang" class="t04_pinjamanangsuran_Sisa_Hutang">
<span<?php echo $t04_pinjamanangsuran->Sisa_Hutang->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Sisa_Hutang->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Tanggal_Bayar->Visible) { // Tanggal_Bayar ?>
		<td data-name="Tanggal_Bayar"<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Tanggal_Bayar" class="form-group t04_pinjamanangsuran_Tanggal_Bayar">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->EditValue ?>"<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Tanggal_Bayar" class="form-group t04_pinjamanangsuran_Tanggal_Bayar">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->EditValue ?>"<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Tanggal_Bayar" class="t04_pinjamanangsuran_Tanggal_Bayar">
<span<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Terlambat->Visible) { // Terlambat ?>
		<td data-name="Terlambat"<?php echo $t04_pinjamanangsuran->Terlambat->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Terlambat" class="form-group t04_pinjamanangsuran_Terlambat">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Terlambat->EditValue ?>"<?php echo $t04_pinjamanangsuran->Terlambat->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Terlambat" class="form-group t04_pinjamanangsuran_Terlambat">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Terlambat->EditValue ?>"<?php echo $t04_pinjamanangsuran->Terlambat->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Terlambat" class="t04_pinjamanangsuran_Terlambat">
<span<?php echo $t04_pinjamanangsuran->Terlambat->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Terlambat->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Total_Denda->Visible) { // Total_Denda ?>
		<td data-name="Total_Denda"<?php echo $t04_pinjamanangsuran->Total_Denda->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Total_Denda" class="form-group t04_pinjamanangsuran_Total_Denda">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Total_Denda->EditValue ?>"<?php echo $t04_pinjamanangsuran->Total_Denda->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Total_Denda" class="form-group t04_pinjamanangsuran_Total_Denda">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Total_Denda->EditValue ?>"<?php echo $t04_pinjamanangsuran->Total_Denda->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Total_Denda" class="t04_pinjamanangsuran_Total_Denda">
<span<?php echo $t04_pinjamanangsuran->Total_Denda->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Total_Denda->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Bayar_Titipan->Visible) { // Bayar_Titipan ?>
		<td data-name="Bayar_Titipan"<?php echo $t04_pinjamanangsuran->Bayar_Titipan->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Titipan">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Titipan->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Titipan->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Titipan">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Titipan->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Titipan->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Titipan" class="t04_pinjamanangsuran_Bayar_Titipan">
<span<?php echo $t04_pinjamanangsuran->Bayar_Titipan->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Bayar_Titipan->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Bayar_Non_Titipan->Visible) { // Bayar_Non_Titipan ?>
		<td data-name="Bayar_Non_Titipan"<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Non_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Non_Titipan">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Non_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Non_Titipan">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Non_Titipan" class="t04_pinjamanangsuran_Bayar_Non_Titipan">
<span<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Bayar_Total->Visible) { // Bayar_Total ?>
		<td data-name="Bayar_Total"<?php echo $t04_pinjamanangsuran->Bayar_Total->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Total" class="form-group t04_pinjamanangsuran_Bayar_Total">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Total->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Total->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Total" class="form-group t04_pinjamanangsuran_Bayar_Total">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Total->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Total->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_Bayar_Total" class="t04_pinjamanangsuran_Bayar_Total">
<span<?php echo $t04_pinjamanangsuran->Bayar_Total->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->Bayar_Total->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->pinjamantitipan_id->Visible) { // pinjamantitipan_id ?>
		<td data-name="pinjamantitipan_id"<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->CellAttributes() ?>>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjamantitipan_id" class="form-group t04_pinjamanangsuran_pinjamantitipan_id">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->EditValue ?>"<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->EditAttributes() ?>>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->OldValue) ?>">
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjamantitipan_id" class="form-group t04_pinjamanangsuran_pinjamantitipan_id">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->EditValue ?>"<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->EditAttributes() ?>>
</span>
<?php } ?>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t04_pinjamanangsuran_grid->RowCnt ?>_t04_pinjamanangsuran_pinjamantitipan_id" class="t04_pinjamanangsuran_pinjamantitipan_id">
<span<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->ViewAttributes() ?>>
<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->ListViewValue() ?></span>
</span>
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="ft04_pinjamanangsurangrid$x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->FormValue) ?>">
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="ft04_pinjamanangsurangrid$o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->OldValue) ?>">
<?php } ?>
<?php } ?>
</td>
	<?php } ?>
<?php

// Render list options (body, right)
$t04_pinjamanangsuran_grid->ListOptions->Render("body", "right", $t04_pinjamanangsuran_grid->RowCnt);
?>
	</tr>
<?php if ($t04_pinjamanangsuran->RowType == EW_ROWTYPE_ADD || $t04_pinjamanangsuran->RowType == EW_ROWTYPE_EDIT) { ?>
<script type="text/javascript">
ft04_pinjamanangsurangrid.UpdateOpts(<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>);
</script>
<?php } ?>
<?php
	}
	} // End delete row checking
	if ($t04_pinjamanangsuran->CurrentAction <> "gridadd" || $t04_pinjamanangsuran->CurrentMode == "copy")
		if (!$t04_pinjamanangsuran_grid->Recordset->EOF) $t04_pinjamanangsuran_grid->Recordset->MoveNext();
}
?>
<?php
	if ($t04_pinjamanangsuran->CurrentMode == "add" || $t04_pinjamanangsuran->CurrentMode == "copy" || $t04_pinjamanangsuran->CurrentMode == "edit") {
		$t04_pinjamanangsuran_grid->RowIndex = '$rowindex$';
		$t04_pinjamanangsuran_grid->LoadDefaultValues();

		// Set row properties
		$t04_pinjamanangsuran->ResetAttrs();
		$t04_pinjamanangsuran->RowAttrs = array_merge($t04_pinjamanangsuran->RowAttrs, array('data-rowindex'=>$t04_pinjamanangsuran_grid->RowIndex, 'id'=>'r0_t04_pinjamanangsuran', 'data-rowtype'=>EW_ROWTYPE_ADD));
		ew_AppendClass($t04_pinjamanangsuran->RowAttrs["class"], "ewTemplate");
		$t04_pinjamanangsuran->RowType = EW_ROWTYPE_ADD;

		// Render row
		$t04_pinjamanangsuran_grid->RenderRow();

		// Render list options
		$t04_pinjamanangsuran_grid->RenderListOptions();
		$t04_pinjamanangsuran_grid->StartRowCnt = 0;
?>
	<tr<?php echo $t04_pinjamanangsuran->RowAttributes() ?>>
<?php

// Render list options (body, left)
$t04_pinjamanangsuran_grid->ListOptions->Render("body", "left", $t04_pinjamanangsuran_grid->RowIndex);
?>
	<?php if ($t04_pinjamanangsuran->pinjaman_id->Visible) { // pinjaman_id ?>
		<td data-name="pinjaman_id">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<?php if ($t04_pinjamanangsuran->pinjaman_id->getSessionValue() <> "") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_pinjaman_id" class="form-group t04_pinjamanangsuran_pinjaman_id">
<span<?php echo $t04_pinjamanangsuran->pinjaman_id->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->pinjaman_id->ViewValue ?></p></span>
</span>
<input type="hidden" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->CurrentValue) ?>">
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_pinjaman_id" class="form-group t04_pinjamanangsuran_pinjaman_id">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->pinjaman_id->EditValue ?>"<?php echo $t04_pinjamanangsuran->pinjaman_id->EditAttributes() ?>>
</span>
<?php } ?>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_pinjaman_id" class="form-group t04_pinjamanangsuran_pinjaman_id">
<span<?php echo $t04_pinjamanangsuran->pinjaman_id->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->pinjaman_id->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjaman_id" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjaman_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjaman_id->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Ke->Visible) { // Angsuran_Ke ?>
		<td data-name="Angsuran_Ke">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Ke" class="form-group t04_pinjamanangsuran_Angsuran_Ke">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Ke->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Ke->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Ke" class="form-group t04_pinjamanangsuran_Angsuran_Ke">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Ke->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Angsuran_Ke->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Ke" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Ke" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Ke->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Tanggal->Visible) { // Angsuran_Tanggal ?>
		<td data-name="Angsuran_Tanggal">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Tanggal" class="form-group t04_pinjamanangsuran_Angsuran_Tanggal">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Tanggal" class="form-group t04_pinjamanangsuran_Angsuran_Tanggal">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Angsuran_Tanggal->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Tanggal" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Tanggal" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Tanggal->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Pokok->Visible) { // Angsuran_Pokok ?>
		<td data-name="Angsuran_Pokok">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Pokok" class="form-group t04_pinjamanangsuran_Angsuran_Pokok">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Pokok" class="form-group t04_pinjamanangsuran_Angsuran_Pokok">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Pokok->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Angsuran_Pokok->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Pokok" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Pokok" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Pokok->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Bunga->Visible) { // Angsuran_Bunga ?>
		<td data-name="Angsuran_Bunga">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Bunga" class="form-group t04_pinjamanangsuran_Angsuran_Bunga">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Bunga" class="form-group t04_pinjamanangsuran_Angsuran_Bunga">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Bunga->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Angsuran_Bunga->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Bunga" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Bunga" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Bunga->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Angsuran_Total->Visible) { // Angsuran_Total ?>
		<td data-name="Angsuran_Total">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Total" class="form-group t04_pinjamanangsuran_Angsuran_Total">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Angsuran_Total->EditValue ?>"<?php echo $t04_pinjamanangsuran->Angsuran_Total->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Angsuran_Total" class="form-group t04_pinjamanangsuran_Angsuran_Total">
<span<?php echo $t04_pinjamanangsuran->Angsuran_Total->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Angsuran_Total->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Angsuran_Total" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Angsuran_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Angsuran_Total->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Sisa_Hutang->Visible) { // Sisa_Hutang ?>
		<td data-name="Sisa_Hutang">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Sisa_Hutang" class="form-group t04_pinjamanangsuran_Sisa_Hutang">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Sisa_Hutang->EditValue ?>"<?php echo $t04_pinjamanangsuran->Sisa_Hutang->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Sisa_Hutang" class="form-group t04_pinjamanangsuran_Sisa_Hutang">
<span<?php echo $t04_pinjamanangsuran->Sisa_Hutang->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Sisa_Hutang->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Sisa_Hutang" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Sisa_Hutang" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Sisa_Hutang->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Tanggal_Bayar->Visible) { // Tanggal_Bayar ?>
		<td data-name="Tanggal_Bayar">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Tanggal_Bayar" class="form-group t04_pinjamanangsuran_Tanggal_Bayar">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->EditValue ?>"<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Tanggal_Bayar" class="form-group t04_pinjamanangsuran_Tanggal_Bayar">
<span<?php echo $t04_pinjamanangsuran->Tanggal_Bayar->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Tanggal_Bayar->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Tanggal_Bayar" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Tanggal_Bayar" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Tanggal_Bayar->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Terlambat->Visible) { // Terlambat ?>
		<td data-name="Terlambat">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Terlambat" class="form-group t04_pinjamanangsuran_Terlambat">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Terlambat->EditValue ?>"<?php echo $t04_pinjamanangsuran->Terlambat->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Terlambat" class="form-group t04_pinjamanangsuran_Terlambat">
<span<?php echo $t04_pinjamanangsuran->Terlambat->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Terlambat->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Terlambat" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Terlambat" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Terlambat->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Total_Denda->Visible) { // Total_Denda ?>
		<td data-name="Total_Denda">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Total_Denda" class="form-group t04_pinjamanangsuran_Total_Denda">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Total_Denda->EditValue ?>"<?php echo $t04_pinjamanangsuran->Total_Denda->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Total_Denda" class="form-group t04_pinjamanangsuran_Total_Denda">
<span<?php echo $t04_pinjamanangsuran->Total_Denda->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Total_Denda->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Total_Denda" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Total_Denda" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Total_Denda->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Bayar_Titipan->Visible) { // Bayar_Titipan ?>
		<td data-name="Bayar_Titipan">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Bayar_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Titipan">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Titipan->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Titipan->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Bayar_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Titipan">
<span<?php echo $t04_pinjamanangsuran->Bayar_Titipan->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Bayar_Titipan->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Titipan" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Titipan->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Bayar_Non_Titipan->Visible) { // Bayar_Non_Titipan ?>
		<td data-name="Bayar_Non_Titipan">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Bayar_Non_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Non_Titipan">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Bayar_Non_Titipan" class="form-group t04_pinjamanangsuran_Bayar_Non_Titipan">
<span<?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Bayar_Non_Titipan->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Non_Titipan" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Non_Titipan" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Non_Titipan->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->Bayar_Total->Visible) { // Bayar_Total ?>
		<td data-name="Bayar_Total">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Bayar_Total" class="form-group t04_pinjamanangsuran_Bayar_Total">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->Bayar_Total->EditValue ?>"<?php echo $t04_pinjamanangsuran->Bayar_Total->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_Bayar_Total" class="form-group t04_pinjamanangsuran_Bayar_Total">
<span<?php echo $t04_pinjamanangsuran->Bayar_Total->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->Bayar_Total->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_Bayar_Total" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_Bayar_Total" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->Bayar_Total->OldValue) ?>">
</td>
	<?php } ?>
	<?php if ($t04_pinjamanangsuran->pinjamantitipan_id->Visible) { // pinjamantitipan_id ?>
		<td data-name="pinjamantitipan_id">
<?php if ($t04_pinjamanangsuran->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_pinjamantitipan_id" class="form-group t04_pinjamanangsuran_pinjamantitipan_id">
<input type="text" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" size="30" placeholder="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->getPlaceHolder()) ?>" value="<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->EditValue ?>"<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->EditAttributes() ?>>
</span>
<?php } else { ?>
<span id="el$rowindex$_t04_pinjamanangsuran_pinjamantitipan_id" class="form-group t04_pinjamanangsuran_pinjamantitipan_id">
<span<?php echo $t04_pinjamanangsuran->pinjamantitipan_id->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t04_pinjamanangsuran->pinjamantitipan_id->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="x<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t04_pinjamanangsuran" data-field="x_pinjamantitipan_id" name="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" id="o<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>_pinjamantitipan_id" value="<?php echo ew_HtmlEncode($t04_pinjamanangsuran->pinjamantitipan_id->OldValue) ?>">
</td>
	<?php } ?>
<?php

// Render list options (body, right)
$t04_pinjamanangsuran_grid->ListOptions->Render("body", "right", $t04_pinjamanangsuran_grid->RowCnt);
?>
<script type="text/javascript">
ft04_pinjamanangsurangrid.UpdateOpts(<?php echo $t04_pinjamanangsuran_grid->RowIndex ?>);
</script>
	</tr>
<?php
}
?>
</tbody>
</table>
<?php if ($t04_pinjamanangsuran->CurrentMode == "add" || $t04_pinjamanangsuran->CurrentMode == "copy") { ?>
<input type="hidden" name="a_list" id="a_list" value="gridinsert">
<input type="hidden" name="<?php echo $t04_pinjamanangsuran_grid->FormKeyCountName ?>" id="<?php echo $t04_pinjamanangsuran_grid->FormKeyCountName ?>" value="<?php echo $t04_pinjamanangsuran_grid->KeyCount ?>">
<?php echo $t04_pinjamanangsuran_grid->MultiSelectKey ?>
<?php } ?>
<?php if ($t04_pinjamanangsuran->CurrentMode == "edit") { ?>
<input type="hidden" name="a_list" id="a_list" value="gridupdate">
<input type="hidden" name="<?php echo $t04_pinjamanangsuran_grid->FormKeyCountName ?>" id="<?php echo $t04_pinjamanangsuran_grid->FormKeyCountName ?>" value="<?php echo $t04_pinjamanangsuran_grid->KeyCount ?>">
<?php echo $t04_pinjamanangsuran_grid->MultiSelectKey ?>
<?php } ?>
<?php if ($t04_pinjamanangsuran->CurrentMode == "") { ?>
<input type="hidden" name="a_list" id="a_list" value="">
<?php } ?>
<input type="hidden" name="detailpage" value="ft04_pinjamanangsurangrid">
</div>
<?php

// Close recordset
if ($t04_pinjamanangsuran_grid->Recordset)
	$t04_pinjamanangsuran_grid->Recordset->Close();
?>
<?php if ($t04_pinjamanangsuran_grid->ShowOtherOptions) { ?>
<div class="panel-footer ewGridLowerPanel">
<?php
	foreach ($t04_pinjamanangsuran_grid->OtherOptions as &$option)
		$option->Render("body", "bottom");
?>
</div>
<div class="clearfix"></div>
<?php } ?>
</div>
</div>
<?php } ?>
<?php if ($t04_pinjamanangsuran_grid->TotalRecs == 0 && $t04_pinjamanangsuran->CurrentAction == "") { // Show other options ?>
<div class="ewListOtherOptions">
<?php
	foreach ($t04_pinjamanangsuran_grid->OtherOptions as &$option) {
		$option->ButtonClass = "";
		$option->Render("body", "");
	}
?>
</div>
<div class="clearfix"></div>
<?php } ?>
<?php if ($t04_pinjamanangsuran->Export == "") { ?>
<script type="text/javascript">
ft04_pinjamanangsurangrid.Init();
</script>
<?php } ?>
<?php
$t04_pinjamanangsuran_grid->ShowPageFooter();
if (EW_DEBUG_ENABLED)
	echo ew_DebugMsg();
?>
<?php
$t04_pinjamanangsuran_grid->Page_Terminate();
?>
