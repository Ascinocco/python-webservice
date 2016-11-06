import web, uuid

urls = (
    '/', 'uuid_generator'
)

# generate uuid
class uuid_generator:
    def GET(self):
        return 'uuid: ' + str(uuid.uuid4())

# run the app
if __name__ == "__main__":
    app.run()

app = web.application(urls, globals(), autoreload=False)
application = app.wsgifunc()