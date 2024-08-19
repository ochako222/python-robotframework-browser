from robot.api.deco import library,keyword
import requests
import yaml

@library(scope='SUITE')
class DocumentsService:
    def __init__(self, core_url):
        self.core_url = core_url

      
    @keyword  
    def get_token(self, user_name:str, user_password:str) -> dict:
        url = f"{self.core_url}/api/v3/authenticate"
        data = {
            "username": user_name,
            "password": user_password
        }
        
        response = requests.post(url, json=data)
        response.raise_for_status()
        
        return response.json()
    
    @keyword 
    def create_new_folder_in_root(self,context: str, token: str, name: str, description: str) -> None:
        """Creates a subfolder in a specified folder."""
        print(f"Creating folder in the folder id: {id} with name: {name} and description: {description}")
        
        url = f"{self.core_url}/api/v3/folders/root/subfolders"
        
        headers = {
            context: token
        }
        data = {
            "name": name,
            "description": description
        }
        
        response = requests.post(url, headers=headers, json=data)
        response.raise_for_status()
        
        return response.json()
    
    @keyword
    def get_all_documents_by_name(self, context:str, token: str, search_for: str, search_in: str):
        """Gets all documents by name."""
        print(f"Getting all documents by name: {search_for}")
        
        url = (f"{self.core_url}/api/v3/folders/{search_in}/items"
               f"?filterText={search_for}&includeUploads=true&max=15&offset=0&orderBy=name&orderDirection=asc")
        
        headers = {
            context: token
        }

        response = requests.get(url, headers=headers)
        response.raise_for_status()
        
        return response.json()
    
    @keyword
    def delete_folder_by_id(self, context: str, token: str, id:str) -> None:
        """Deletes a folder by its ID."""
        print(f"Deleting folder with id: {id}")
        
        url = f"{self.core_url}/api/v3/folders/{id}"
        headers = {
            context: token
        }

        response = requests.delete(url, headers=headers)
        response.raise_for_status()

        print(f"Folder with id {id} successfully deleted.")
        
        
   
