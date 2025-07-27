from example_lib.another_library import another_function
from example_lib.some_library import some_function

from example_app.main_library import run_some_function


def main():
    print("Hello from example-app!")
    print(some_function())
    print(another_function())
    run_some_function()


if __name__ == "__main__":
    main()
