int main(string[] args) {
    Gtk.init (ref args);

    var window = new MyApp();
    
    window.window_main.show_all();

    Gtk.main();
    return 0;
}