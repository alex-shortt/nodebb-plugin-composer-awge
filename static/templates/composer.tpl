<div component="composer" class="awge-composer composer awge-windows <!-- IF resizable --> resizable<!-- ENDIF resizable --><!-- IF !isTopicOrMain --> reply<!-- ENDIF !isTopicOrMain -->">
	<div class="awge-windows-title">
		<div class="pull-right">
			<button class="minimize"><span class="fa fa-minus"></span></button>
			<button class="expand"><span class="fa fa-square-o"></span></button>
			<button class="times"><span class="fa fa-times"></span></button>
		</div>
		<h1 class="awge-windows-title-text">
			<!-- IF isTopic -->
				New Topic
			<!-- ENDIF isTopic -->
			
			<!-- IF !isTopicOrMain -->
				[[topic:composer.replying_to, "{title}"]] 
			<!-- ENDIF !isTopicOrMain -->
		</h1>
	</div>

	<ul class="awge-windows-toolbar">
		<li class="awge-windows-toolbar-option">
			<a class="composer-discard" data-action="discard" tabindex="-1"><u>D</u>iscard</a>
		</li>
		<li class="awge-windows-toolbar-option">
			<a class="composer-submit" data-action="post" tabindex="-1"><u>S</u>ubmit</a>
		</li>
		<!-- IF isTopic -->
		<li class="awge-windows-toolbar-option awge-composer-onlymobile">
			<div class="category-name-container">
				<span class="category-name"></span> <i class="fa fa-sort"></i>
			</div>
		</li>
		<!-- ENDIF isTopic -->
	</ul>

	<div class="awge-windows-container awge-composer-container">
		<div class="composer-container">
			<div class="row title-container">
				<!-- IF showHandleInput -->
				<div class="col-sm-3 col-md-12">
					<input class="handle form-control" type="text" tabindex="1" placeholder="[[topic:composer.handle_placeholder]]" value="{handle}" />
				</div>
				<div class="<!-- IF isTopic -->col-lg-9<!-- ELSE -->col-lg-12<!-- ENDIF isTopic --> col-md-12">
					<!-- IF isTopicOrMain -->
					<input class="title form-control" type="text" tabindex="1" placeholder="[[topic:composer.title_placeholder]]" value="{title}" />
					<!-- ELSE -->
					<span class="title form-control">[[topic:composer.replying_to, "{title}"]]</span>
					<!-- ENDIF isTopicOrMain -->
				</div>
				<!-- ELSE -->
				<div class="<!-- IF isTopic -->col-lg-9<!-- ELSE -->col-lg-12<!-- ENDIF isTopic --> col-md-12">
					<!-- IF isTopicOrMain -->
					<input class="title form-control" type="text" tabindex="1" placeholder="[[topic:composer.title_placeholder]]" value="{title}" />
					<!-- ELSE -->
					<span class="title form-control">[[topic:composer.replying_to, "{title}"]]</span>
					<!-- ENDIF isTopicOrMain -->
				</div>
				<!-- ENDIF showHandleInput -->
				<!-- IF isTopic -->
				<div class="category-list-container col-lg-3 col-md-12 hidden-sm hidden-xs">

				</div>
				<!-- ENDIF isTopic -->
			</div>
			<div class="category-tag-row">
				<div class="btn-toolbar formatting-bar">
					<ul class="formatting-group">
						<!-- BEGIN formatting -->
						<!-- IF formatting.spacer -->
						<li class="spacer"></li>
						<!-- ELSE -->
						<!-- IF !formatting.mobile -->
						<li tabindex="-1" data-format="{formatting.name}" title="{formatting.title}"><i class="{formatting.className}"></i></li>
						<!-- ENDIF !formatting.mobile -->
						<!-- ENDIF formatting.spacer -->
						<!-- END formatting -->

						<!--[if gte IE 9]><!-->
						<!-- IF privileges.upload:post:image -->
						<li class="img-upload-btn hide" data-format="picture" tabindex="-1" title="[[modules:composer.upload-picture]]">
							<i class="fa fa-cloud-upload"></i>
						</li>
						<!-- ENDIF privileges.upload:post:image -->
						<!-- IF privileges.upload:post:file -->
						<li class="file-upload-btn hide" data-format="upload" tabindex="-1" title="[[modules:composer.upload-file]]">
							<i class="fa fa-upload"></i>
						</li>
						<!-- ENDIF privileges.upload:post:file -->
						<!--<![endif]-->

						<!-- IF allowTopicsThumbnail -->
						<li tabindex="-1">
							<i class="fa fa-th-large topic-thumb-btn topic-thumb-toggle-btn hide" title="[[topic:composer.thumb_title]]"></i>
						</li>
						<div class="topic-thumb-container center-block hide">
							<form id="thumbForm" method="post" class="topic-thumb-form form-inline" enctype="multipart/form-data">
								<img class="topic-thumb-preview"></img>
								<div class="form-group">
									<label for="topic-thumb-url">[[topic:composer.thumb_url_label]]</label>
									<input type="text" id="topic-thumb-url" class="form-control" placeholder="[[topic:composer.thumb_url_placeholder]]" />
								</div>
								<div class="form-group">
									<label for="topic-thumb-file">[[topic:composer.thumb_file_label]]</label>
									<input type="file" id="topic-thumb-file" class="form-control" />
								</div>
								<div class="form-group topic-thumb-ctrl">
									<i class="fa fa-spinner fa-spin hide topic-thumb-spinner" title="[[topic:composer.uploading]]"></i>
									<i class="fa fa-times topic-thumb-btn hide topic-thumb-clear-btn" title="[[topic:composer.thumb_remove]]"></i>
								</div>
							</form>
						</div>
						<!-- ENDIF allowTopicsThumbnail -->

						<form id="fileForm" method="post" enctype="multipart/form-data">
							<!--[if gte IE 9]><!-->
							<input type="file" id="files" name="files[]" multiple class="gte-ie9 hide" />
							<!--<![endif]-->
							<!--[if lt IE 9]>
							<input type="file" id="files" name="files[]" class="lt-ie9 hide" value="Upload"/>
						<![endif]-->
						</form>
					</ul>
				</div>
			</div>

			<div class="row write-preview-container awge-composer-textcontainer">
				<div class="write-container">
					<div class="help-text">
						<span class="help hidden">[[modules:composer.compose]] <i class="fa fa-question-circle"></i></span>
						<span class="toggle-preview hide">[[modules:composer.show_preview]]</span>
					</div>
					<textarea class="write" tabindex="4"></textarea>
				</div>
				<div class="hidden-sm hidden-xs preview-container">
					<div class="help-text">
						<span class="toggle-preview">[[modules:composer.hide_preview]]</span>
					</div>
					<div class="preview well"></div>
				</div>
			</div>

			<!-- IF isTopicOrMain -->
			<div class="tag-row">
				<div class="tags-container">
					<div class="btn-group dropup <!-- IF !tagWhitelist.length -->hidden<!-- ENDIF !tagWhitelist.length -->" component="composer/tag/dropdown">
						<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
						<span class="visible-sm-inline visible-md-inline visible-lg-inline"><i class="fa fa-tags"></i></span>
						<span class="caret"></span>
					</button>

						<ul class="dropdown-menu">
							<!-- BEGIN tagWhitelist -->
							<li data-tag="@value"><a href="#">@value</a></li>
							<!-- END tagWhitelist -->
						</ul>
					</div>
					<input class="tags" type="text" class="form-control" placeholder="[[tags:enter_tags_here, {minimumTagLength}, {maximumTagLength}]]" tabindex="5" />
				</div>
			</div>
			<!-- ENDIF isTopicOrMain -->

			<!-- IF isTopic -->
			<ul class="category-selector visible-xs visible-sm">

			</ul>
			<!-- ENDIF isTopic -->

			<div class="imagedrop">
				<div>[[topic:composer.drag_and_drop_images]]</div>
			</div>
		</div>
	</div>

	<div class="awge-windows-statusbar">
		<div class="left">
			<p>© 2017 AWGE</p>
		</div>
		<div class="right">
			<!-- IMPORT partials/breadcrumbs.tpl -->
		</div>
	</div>
</div>

<!-- IMPORT partials/awge_page_script.tpl -->
