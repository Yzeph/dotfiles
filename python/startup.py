# PYTHONSTARTUP 脚本：接管 Python 交互式历史文件的位置
import atexit, os, readline

_hist = os.path.join(
    os.environ.get("XDG_STATE_HOME", os.path.expanduser("~/.local/state")),
    "python_history",
)
os.makedirs(os.path.dirname(_hist), exist_ok=True)
if not os.path.exists(_hist):
    open(_hist, "a").close()      # 关键：先建文件，理由见下面的陷阱

try:
    readline.read_history_file(_hist)
except OSError:
    pass

atexit.register(readline.write_history_file, _hist)
