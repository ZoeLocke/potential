// /scr_Scale room()
if (browser_width != width || browser_height != height){
    width = min(base_width, browser_width);
    height = min(base_height, browser_height);
};

var aspect = (base_width / base_height);
if ((width / aspect) > height)window_set_size((height * aspect), height) else window_set_size(width, (width / aspect));
if (resizeWindow) window_center();
surface_resize(application_surface, min(window_get_width(), base_width), min(window_get_height(), base_height));

