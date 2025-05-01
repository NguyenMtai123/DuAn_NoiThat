/**
 * @license Copyright (c) 2003-2023, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    //config.language = 'vi';
    config.filebrowserBrowseUrl = "/Assets/admin/Plugin/ckfinder/ckfinder.html";
    config.fliebrowserImageUrl = "/Assets/admin/Plugin/ckfinder/ckfinder.html?type=Images";
    config.filebrowserFlashUrl = "/Assets/admin/Plugin/ckfinder/ckfinder.html?type=Flash";
    config.filebrowserUploadUrl = "/Assets/admin/Plugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUploadUrl&type=Files";
    config.filebrowserImageUploadUrl = "/Assets/admin/Plugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUploadUrl&type=Images";
    config.filebrowserFlashUrlloadUrl = "/Assets/admin/Plugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUploadUrl&type=Flash";

    //CKFinder.setupCKEditor(null, '/Assets/admin/Plugin/ckfinfer/');
    //config.extraPlugins = 'youtube';
    //config.youtube_responsive = true;
};
