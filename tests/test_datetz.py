import pytest

from project.helpers.datetz import DateTZ


def test_invalid_timezone() -> None:
    with pytest.raises(ValueError):
        DateTZ().now(tz="Invalid/Timezone")


def test_utc_timezone() -> None:
    utc = DateTZ().now()
    assert pytest.approx(utc.offset_hours) == 0


def test_pacific_timezone() -> None:
    pacific = DateTZ().now(tz="America/Los_Angeles")
    assert pytest.approx(pacific.offset_hours) == -7


def test_mountain_timezone() -> None:
    mountain = DateTZ().now(tz="America/Denver")
    assert pytest.approx(mountain.offset_hours) == -6


def test_central_timezone() -> None:
    central = DateTZ().now(tz="America/Chicago")
    assert pytest.approx(central.offset_hours) == -5


def test_eastern_timezone() -> None:
    eastern = DateTZ().now(tz="America/New_York")
    assert pytest.approx(eastern.offset_hours) == -4
