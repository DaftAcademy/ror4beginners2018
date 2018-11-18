# frozen_string_literal: true

module BestiaryHelper
    def table_header
        '<tr>
            <th>ID</th>
            <th>Name</th>
            <th>Location</th>
            <th>Best Slayer</th>
        </tr>'.html_safe
    end
end
