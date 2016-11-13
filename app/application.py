import web, uuid

urls = (
    '/', 'GenerateUUID'
)


# Implement Get Method
class GenerateUUID:
    def GET(self):
        return str(uuid.uuid4())

# Configure the web application
app = web.application(urls, globals(), autoreload=False)
application = app.wsgifunc()

# Run the Application
if __name__ == "__main__":
    app.run()
