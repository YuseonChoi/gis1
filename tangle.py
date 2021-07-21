def check_integer(func):
    def decorated(width, height):
        if width >0 and height > 0:
            return func(width, height)
        else:
            raise ValueError('Input must be positive value')
    return decorated()

def triangle(width, height):
    return width * height / 2

def rectangle(width, height):
    return width * height

rect_area = rectangle(-10,10)
print(rect_area)

tri_area = triangle(10,10)
print(tri_area)


