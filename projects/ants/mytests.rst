This file holds the tests that you create. Remember to import the python file(s)
you wish to test, along with any other modules you may need.
Run your tests with "python3 ok -t --suite SUITE_NAME --case CASE_NAME -v"
--------------------------------------------------------------------------------

Suite 1

    >>> from ants import *

	Case Example
		>>> x = 5
		>>> x
		5

Suite 2

    >>> from ants import *
    Case Example
        >>> hive, layout = Hive(AssaultPlan()), dry_layout
        >>> dimensions = (1,9)
        >>> colony = AntColony(None, hive, ant_types(), layout, dimensions)
        >>> # Testing long effect stack
        >>> scary = ScaryThrower()
        >>> slow = SlowThrower()
        >>> bee = Bee(3)
        >>> colony.places["tunnel_0_0"].add_insect(scary)
        >>> colony.places["tunnel_0_1"].add_insect(slow)
        >>> colony.places["tunnel_0_3"].add_insect(bee)

        >>> scary.action(colony) # scare bee once

        >>> colony.time = 0
        >>> bee.action(colony) # scared
        >>> bee.place.name
        'tunnel_0_4'

        >>> for _ in range(3): # slow bee three times
        ...    slow.action(colony)

        >>> colony.time = 1
        >>> bee.action(colony) # scared, but also slowed thrice
        >>> bee.place.name
        'tunnel_0_4'

        >>> colony.time = 2
        >>> bee.action(colony) # scared and slowed thrice
        >>> bee.place.name
        'tunnel_0_5'

        >>> colony.time = 4
        >>> bee.action(colony) # slowed twice
        >>> bee.place.name
        'tunnel_0_4'

        >>> colony.time = 5
        >>> bee.action(colony) # slowed twice
        >>> bee.place.name
        'tunnel_0_4'

        >>> colony.time = 6
        >>> bee.action(colony) # slowed once
        >>> bee.place.name
        'tunnel_0_3'

        >>> bee.effect['slow']
        0

        >>> colony.time = 7
        >>> bee.action(colony) # status effects have worn off
        >>> bee.place.name
        'tunnel_0_2'