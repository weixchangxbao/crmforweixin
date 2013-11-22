<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/admin/user/update" method="post" class="form-horizontal">
		<div class="row-fluid sortable ui-sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-edit"></i> Form Elements</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal">
							<fieldset>
							  <div class="control-group">
								<label class="control-label" for="focusedInput">Focused input</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="focusedInput" type="text" value="This is focused…">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label">Uneditable input</label>
								<div class="controls">
								  <span class="input-xlarge uneditable-input">Some value here</span>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="disabledInput">Disabled input</label>
								<div class="controls">
								  <input class="input-xlarge disabled" id="disabledInput" type="text" placeholder="Disabled input here…" disabled="">
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="optionsCheckbox2">Disabled checkbox</label>
								<div class="controls">
								  <label class="checkbox">
									<div class="checker disabled" id="uniform-optionsCheckbox2"><span><input type="checkbox" id="optionsCheckbox2" value="option1" disabled="" style="opacity: 0;"></span></div>
									This is a disabled checkbox
								  </label>
								</div>
							  </div>
							  <div class="control-group warning">
								<label class="control-label" for="inputWarning">Input with warning</label>
								<div class="controls">
								  <input type="text" id="inputWarning">
								  <span class="help-inline">Something may have gone wrong</span>
								</div>
							  </div>
							  <div class="control-group error">
								<label class="control-label" for="inputError">Input with error</label>
								<div class="controls">
								  <input type="text" id="inputError">
								  <span class="help-inline">Please correct the error</span>
								</div>
							  </div>
							  <div class="control-group success">
								<label class="control-label" for="inputSuccess">Input with success</label>
								<div class="controls">
								  <input type="text" id="inputSuccess">
								  <span class="help-inline">Woohoo!</span>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="selectError3">Plain Select</label>
								<div class="controls">
								  <select id="selectError3">
									<option>Option 1</option>
									<option>Option 2</option>
									<option>Option 3</option>
									<option>Option 4</option>
									<option>Option 5</option>
								  </select>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="selectError">Modern Select</label>
								<div class="controls">
								  <select id="selectError" data-rel="chosen" style="display: none;" class="chzn-done">
									<option>Option 1</option>
									<option>Option 2</option>
									<option>Option 3</option>
									<option>Option 4</option>
									<option>Option 5</option>
								  </select><div id="selectError_chzn" class="chzn-container chzn-container-single" style="width: 220px;"><a href="javascript:void(0)" class="chzn-single"><span>Option 1</span><div><b></b></div></a><div class="chzn-drop" style="left: -9000px; width: 218px; top: 25px;"><div class="chzn-search"><input type="text" autocomplete="off" style="width: 183px;"></div><ul class="chzn-results"><li id="selectError_chzn_o_0" class="active-result result-selected" style="">Option 1</li><li id="selectError_chzn_o_1" class="active-result" style="">Option 2</li><li id="selectError_chzn_o_2" class="active-result" style="">Option 3</li><li id="selectError_chzn_o_3" class="active-result" style="">Option 4</li><li id="selectError_chzn_o_4" class="active-result" style="">Option 5</li></ul></div></div>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="selectError1">Multiple Select / Tags</label>
								<div class="controls">
								  <select id="selectError1" multiple="" data-rel="chosen" style="display: none;" class="chzn-done">
									<option>Option 1</option>
									<option selected="">Option 2</option>
									<option>Option 3</option>
									<option>Option 4</option>
									<option>Option 5</option>
								  </select><div id="selectError1_chzn" class="chzn-container chzn-container-multi" style="width: 220px;"><ul class="chzn-choices"><li class="search-choice" id="selectError1_chzn_c_1"><span>Option 2</span><a href="javascript:void(0)" class="search-choice-close" rel="1"></a></li><li class="search-field"><input type="text" value="Select Some Options" class="" autocomplete="off" style="width: 25px;"></li></ul><div class="chzn-drop" style="left: -9000px; width: 218px; top: 29px;"><ul class="chzn-results"><li id="selectError1_chzn_o_0" class="active-result" style="">Option 1</li><li id="selectError1_chzn_o_1" class="result-selected" style="">Option 2</li><li id="selectError1_chzn_o_2" class="active-result" style="">Option 3</li><li id="selectError1_chzn_o_3" class="active-result" style="">Option 4</li><li id="selectError1_chzn_o_4" class="active-result" style="">Option 5</li></ul></div></div>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="selectError2">Group Select</label>
								<div class="controls">
									<select data-placeholder="Your Favorite Football Team" id="selectError2" data-rel="chosen" style="display: none;" class="chzn-done">
										<option value=""></option>
										<optgroup label="NFC EAST">
										  <option>Dallas Cowboys</option>
										  <option>New York Giants</option>
										  <option>Philadelphia Eagles</option>
										  <option>Washington Redskins</option>
										</optgroup>
										<optgroup label="NFC NORTH">
										  <option>Chicago Bears</option>
										  <option>Detroit Lions</option>
										  <option>Green Bay Packers</option>
										  <option>Minnesota Vikings</option>
										</optgroup>
										<optgroup label="NFC SOUTH">
										  <option>Atlanta Falcons</option>
										  <option>Carolina Panthers</option>
										  <option>New Orleans Saints</option>
										  <option>Tampa Bay Buccaneers</option>
										</optgroup>
										<optgroup label="NFC WEST">
										  <option>Arizona Cardinals</option>
										  <option>St. Louis Rams</option>
										  <option>San Francisco 49ers</option>
										  <option>Seattle Seahawks</option>
										</optgroup>
										<optgroup label="AFC EAST">
										  <option>Buffalo Bills</option>
										  <option>Miami Dolphins</option>
										  <option>New England Patriots</option>
										  <option>New York Jets</option>
										</optgroup>
										<optgroup label="AFC NORTH">
										  <option>Baltimore Ravens</option>
										  <option>Cincinnati Bengals</option>
										  <option>Cleveland Browns</option>
										  <option>Pittsburgh Steelers</option>
										</optgroup>
										<optgroup label="AFC SOUTH">
										  <option>Houston Texans</option>
										  <option>Indianapolis Colts</option>
										  <option>Jacksonville Jaguars</option>
										  <option>Tennessee Titans</option>
										</optgroup>
										<optgroup label="AFC WEST">
										  <option>Denver Broncos</option>
										  <option>Kansas City Chiefs</option>
										  <option>Oakland Raiders</option>
										  <option>San Diego Chargers</option>
										</optgroup>
								  </select><div id="selectError2_chzn" class="chzn-container chzn-container-single" style="width: 220px;"><a href="javascript:void(0)" class="chzn-single chzn-default"><span>Your Favorite Football Team</span><div><b></b></div></a><div class="chzn-drop" style="left: -9000px; width: 218px; top: 25px;"><div class="chzn-search"><input type="text" autocomplete="off" style="width: 183px;"></div><ul class="chzn-results"><li id="selectError2_chzn_g_1" class="group-result">NFC EAST</li><li id="selectError2_chzn_o_2" class="active-result group-option" style="">Dallas Cowboys</li><li id="selectError2_chzn_o_3" class="active-result group-option" style="">New York Giants</li><li id="selectError2_chzn_o_4" class="active-result group-option" style="">Philadelphia Eagles</li><li id="selectError2_chzn_o_5" class="active-result group-option" style="">Washington Redskins</li><li id="selectError2_chzn_g_6" class="group-result">NFC NORTH</li><li id="selectError2_chzn_o_7" class="active-result group-option" style="">Chicago Bears</li><li id="selectError2_chzn_o_8" class="active-result group-option" style="">Detroit Lions</li><li id="selectError2_chzn_o_9" class="active-result group-option" style="">Green Bay Packers</li><li id="selectError2_chzn_o_10" class="active-result group-option" style="">Minnesota Vikings</li><li id="selectError2_chzn_g_11" class="group-result">NFC SOUTH</li><li id="selectError2_chzn_o_12" class="active-result group-option" style="">Atlanta Falcons</li><li id="selectError2_chzn_o_13" class="active-result group-option" style="">Carolina Panthers</li><li id="selectError2_chzn_o_14" class="active-result group-option" style="">New Orleans Saints</li><li id="selectError2_chzn_o_15" class="active-result group-option" style="">Tampa Bay Buccaneers</li><li id="selectError2_chzn_g_16" class="group-result">NFC WEST</li><li id="selectError2_chzn_o_17" class="active-result group-option" style="">Arizona Cardinals</li><li id="selectError2_chzn_o_18" class="active-result group-option" style="">St. Louis Rams</li><li id="selectError2_chzn_o_19" class="active-result group-option" style="">San Francisco 49ers</li><li id="selectError2_chzn_o_20" class="active-result group-option" style="">Seattle Seahawks</li><li id="selectError2_chzn_g_21" class="group-result">AFC EAST</li><li id="selectError2_chzn_o_22" class="active-result group-option" style="">Buffalo Bills</li><li id="selectError2_chzn_o_23" class="active-result group-option" style="">Miami Dolphins</li><li id="selectError2_chzn_o_24" class="active-result group-option" style="">New England Patriots</li><li id="selectError2_chzn_o_25" class="active-result group-option" style="">New York Jets</li><li id="selectError2_chzn_g_26" class="group-result">AFC NORTH</li><li id="selectError2_chzn_o_27" class="active-result group-option" style="">Baltimore Ravens</li><li id="selectError2_chzn_o_28" class="active-result group-option" style="">Cincinnati Bengals</li><li id="selectError2_chzn_o_29" class="active-result group-option" style="">Cleveland Browns</li><li id="selectError2_chzn_o_30" class="active-result group-option" style="">Pittsburgh Steelers</li><li id="selectError2_chzn_g_31" class="group-result">AFC SOUTH</li><li id="selectError2_chzn_o_32" class="active-result group-option" style="">Houston Texans</li><li id="selectError2_chzn_o_33" class="active-result group-option" style="">Indianapolis Colts</li><li id="selectError2_chzn_o_34" class="active-result group-option" style="">Jacksonville Jaguars</li><li id="selectError2_chzn_o_35" class="active-result group-option" style="">Tennessee Titans</li><li id="selectError2_chzn_g_36" class="group-result">AFC WEST</li><li id="selectError2_chzn_o_37" class="active-result group-option" style="">Denver Broncos</li><li id="selectError2_chzn_o_38" class="active-result group-option" style="">Kansas City Chiefs</li><li id="selectError2_chzn_o_39" class="active-result group-option" style="">Oakland Raiders</li><li id="selectError2_chzn_o_40" class="active-result group-option" style="">San Diego Chargers</li></ul></div></div>
								</div>
							  </div>
							  <div class="form-actions">
								<button type="submit" class="btn btn-primary">Save changes</button>
								<button class="btn">Cancel</button>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
			
			</div>
	</form>
	
</body>
</html>
