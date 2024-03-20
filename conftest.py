import sys
from pathlib import Path

# Get the path of the root directory
root_dir = Path(__file__).resolve().parent

# Append the "src" directory to this path
src_dir = root_dir / "src"

# Add this path to the system path
sys.path.insert(0, str(src_dir))
