import pytest

from project.helpers.datetz import DateTZ


def test_invalid_timezone() -> None:
    with pytest.raises(ValueError):
        DateTZ(tz="Invalid/Timezone").now()


def test_utc_timezone() -> None:
    utc = DateTZ().now()
    assert pytest.approx(utc.offset_hours) == 0


def test_pacific_timezone() -> None:
    pacific = DateTZ(tz="America/Los_Angeles").now()
    assert pytest.approx(pacific.offset_hours) == -7


def test_mountain_timezone() -> None:
    mountain = DateTZ(tz="America/Denver").now()
    assert pytest.approx(mountain.offset_hours) == -6


def test_central_timezone() -> None:
    central = DateTZ(tz="America/Chicago").now()
    assert pytest.approx(central.offset_hours) == -5


def test_eastern_timezone() -> None:
    eastern = DateTZ(tz="America/New_York").now()
    assert pytest.approx(eastern.offset_hours) == -4
