namespace PhpTester {
public class Cheatsheet : Gtk.Dialog {
  
    private HeaderLabel general_header = new HeaderLabel ("Cheatsheet");

    public Cheatsheet(){
        title = "Cheatsheet";
        resizable = false;
        deletable = false;

        Gtk.Label[] labels = {};
        Gtk.Label[] shortcuts = {};

        labels += generateLabel ("Run the code");
        shortcuts += generateEntry ("ctrl + r");

        labels += generateLabel ("Copy input");
        shortcuts += generateEntry ("ctrl + i");

        labels += generateLabel ("Copy output"); 
        shortcuts += generateEntry ("ctrl + o");

        labels += generateLabel ("Open the cheatsheet");
        shortcuts += generateEntry ("ctrl + h");

        var close_button = new Gtk.Button.with_label ("Close");
        close_button.margin_right = 6;
        close_button.clicked.connect (() => {
            this.destroy ();
        });

        var button_box = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);
        button_box.set_layout (Gtk.ButtonBoxStyle.END);
        button_box.pack_start (close_button);
        button_box.margin = 12;
        button_box.margin_bottom = 0;

        var cheatsheet_grid = generateGrid(shortcuts, labels);

        var main_grid = new Gtk.Grid ();
        main_grid.attach (cheatsheet_grid, 0, 0, 1, 1);
        main_grid.attach (button_box, 0, 1, 1, 1);
        
        ((Gtk.Container) get_content_area ()).add (main_grid);
        this.show_all ();
    }

    public Gtk.Grid generateGrid(Gtk.Label[] shortcuts, Gtk.Label[] labels){
        var grid = new Gtk.Grid ();
        grid.row_spacing = 6;
        grid.column_spacing = 12;
        grid.margin = 12;
        grid.attach (general_header, 0, 0, 2, 1);

        var gridPosition = 1;
        var index = 0;

        foreach(Gtk.Label shortcut in shortcuts){
            grid.attach (labels[index], 0, gridPosition, 1, 1);
            grid.attach (shortcuts[index], 1, gridPosition, 1, 1);

            gridPosition++;
            index++;
        }

        return grid;
    }

    public Gtk.Label generateLabel (string labelText){
        var label = new Gtk.Label (labelText);
        label.halign = Gtk.Align.START;

        return label;
    }
    
    public Gtk.Label generateEntry (string entryText){
        var entry = new Gtk.Label (null);
        entry.set_markup("<b>" + entryText + "</b>");

        return entry;
    }
    
}
}
