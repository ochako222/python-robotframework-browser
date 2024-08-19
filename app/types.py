from robot.api.deco import library,keyword

# @library(scope='GLOBAL')
# class ExampleLibrary:
#     def __init__(self):
#         self._counter = 0

#     @keyword
#     def get_new_folder(self):
#         self._counter += 1
#         print(self._counter)

@keyword
def get_new_folder():
    return {'title': "It's a title", 'description': "it's a description"} 