"""Module for the DateTZ class."""

from typing import Optional, Self

import pendulum


class DateTZ:
    """A class used to represent a date with a timezone."""

    def now(self: Self, tz: Optional[str] = "UTC") -> pendulum.DateTime:
        """Returns the current date and time with the default timezone.

        Parameters:
        ---
        tz: Optional[str]
            The timezone to use for the current date and time. Defaults to "UTC".

        Returns:
        ---
        pendulum.DateTime
            A pendulum DateTime object representing the current date and time with the default timezone.
        """
        return pendulum.now(tz=tz)
