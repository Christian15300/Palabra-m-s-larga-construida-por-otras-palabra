try:
    raise Exception("Se ha producido un error")
except Exception:
    print("a")
except:
    print("b")
except BaseException:
    print("c")

