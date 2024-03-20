from helpers.datetz import DateTZ


def main() -> None:
    central = DateTZ(tz="America/Chicago").now()
    print(central)


if __name__ == "__main__":
    main()
