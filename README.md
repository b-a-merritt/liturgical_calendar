## Justification
Prolog is best suited for the Catholic liturgical calendar because the system is defined by a hierarchy of logical constraints rather than a simple linear chronology. The calendar functions as a conflict-resolution engine between two overlapping cycles: the Temporale (the movable cycle centered on Easter and Advent) and the Sanctorale (the fixed cycle of saints' feast days).

In a procedural language, resolving a date involves complex nested if-else blocks to determine which observance takes precedence. In Prolog, these rules are expressed as declarative facts and rules. You can define the precedence as a set of logical predicates. When the software queries a specific date, Prolog’s backtracking mechanism automatically evaluates both the Temporale and Sanctorale events for that day, compares their assigned ranking, and returns the one with the highest priority.

The computation of the Temporale relies heavily on the the calculation of Easter. Since Easter is the first Sunday after the first full moon on or after the vernal equinox, its date changes every year, affecting Septuagesima, Lent, and Pentecost. Prolog handles these shifting dependencies through recursive rules. You can define a rule where a liturgical season is valid only if the current date falls within a specific range relative to a calculated easter_date(Year, Date). This allows the calendar to solve itself for any given year without hard-coding thousands of individual dates.

## Development
To start

`swipl`

To end

`halt.`

