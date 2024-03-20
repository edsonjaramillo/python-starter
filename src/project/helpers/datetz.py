"""Module for the DateTZ class."""

from typing import Optional, Self

import pendulum


class DateTZ:
    """A class used to represent a date with a timezone."""

    def __init__(self: Self, tz: Optional[str] = "UTC") -> None:
        """Initializes the DateTZ class.

        Parameters:
        ---
        tz : Optional[str]
            The timezone to use. Defaults to "UTC".
        """
        self.tz = tz

    def now(self: Self) -> pendulum.DateTime:
        """Returns the current date and time with the default timezone.

        Returns:
        ---
        pendulum.DateTime
            A pendulum DateTime object representing the current date and time with the default timezone.
        """
        return pendulum.now(tz=self.tz)
