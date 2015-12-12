CKEDITOR.editorConfig = function( config )
{
    // Add WIRIS to the plugin list
    config.extraPlugins += (config.extraPlugins.length == 0 ? '' : ',') + 'ckeditor_wiris';
};