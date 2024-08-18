class FolderEntity:
    def __init__(self, name, description):
        self.name = name
        self.description = description

    def __repr__(self):
        return f"FolderEntity(name='{self.name}', description='{self.description}')"