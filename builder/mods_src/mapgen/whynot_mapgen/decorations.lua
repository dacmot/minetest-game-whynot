--------------------------------------------------------------------------------
--
-- Minetest -- Why Not? Game -- Map generation customisation
-- Copyright (C) 2022  Olivier Dragon
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------

--
-- This file contains modifications to the decorations for the whynot map/world generation
--

local rdecor = table.copy(minetest.registered_decorations)
minetest.clear_registered_decorations()
for _, def in pairs(rdecor) do
    minetest.register_decoration(def)
end