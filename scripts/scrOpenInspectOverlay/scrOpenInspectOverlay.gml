function scrOpenInspectOverlay(_inspectData) {
    if (instance_exists(objInspectOverlay)) return;
    
    if (!layer_exists("TopLayer")) {
        layer_create(-100000, "TopLayer");
    }
    var overlay = instance_create_layer(
        camera_get_view_width(view_camera[0]) / 2,
        camera_get_view_height(view_camera[0]) / 2,
        "TopLayer", objInspectOverlay
    );
    overlay.image_xscale     = 20;
    overlay.image_yscale     = 20;
    overlay.inspectData      = _inspectData;
    overlay.isManagingDialog = true;
    global.dialog            = true;
}
