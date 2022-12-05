from django.db import models

class Notes(models.Model):
    title=models.CharField(max_length=144,default=True)
    body=models.TextField()
    updated=models.DateTimeField(auto_now=True)
    created=models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering=['-updated']
       