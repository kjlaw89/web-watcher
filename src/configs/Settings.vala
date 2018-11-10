/*
* Copyright (c) 2018 KJ Lawrence <kjtehprogrammer@gmail.com>
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*/

namespace App.Configs {

    /**
     * The {@code Settings} class is responsible for defining all
     * the texts that are displayed in the application and must be translated.
     *
     * @see Granite.Services.Settings
     * @since 1.0.0
     */
    public class Settings : Granite.Services.Settings {

        /**
         * This static property represents the {@code Settings} type.
         */
        private static Settings? instance;

        /**
         * Last known X position of the window
         */
        public int window_x { get; set; }

        /**
         * Last known Y position of the window
         */
        public int window_y { get; set; }

        /**
         * Should application hide on close or shutdown
         */
        public bool hide_on_close { get; set; }

        /**
         * Should application start hidden
         */
        public bool hide_on_start { get; set; }

        /**
         * Constructs a new {@code Settings} object
         * and sets the default exit folder.
         *
         * @see webwatcher.Utils.StringUtil#is_empty(string)
         * @see webwatcher.Constants
         */
        private Settings () {
            base (Constants.ID);
        }

        /**
         * Returns a single instance of this class.
         *
         * @return {@code Settings}
         */
        public static unowned Settings get_instance () {
            if (instance == null) {
                instance = new Settings ();
            }

            return instance;
        }

        public void save_window_pos (Gtk.Window window) {
            int x;
            int y;
            window.get_position (out x, out y);

            window_x = x;
            window_y = y;
        }
    }
}
