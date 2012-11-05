import datetime

from django.db import models
from django.conf import settings
from django import forms

from shorter.baseconv import base62

class Link(models.Model):
    """
    Model that represents a shortened URL
    """
    url = models.URLField(unique=True)
    date_submitted = models.DateTimeField(auto_now_add=True)
    usage_count = models.IntegerField(default=0)

    def save(self, *args, **kwargs):
        if not self.id:
            # Check url: we don't want cyclic relationships
            if settings.SHORTER_SITE_NAME in self.url:
                raise AttributeError(u'This URL has already been shortened!')
        super(Link, self).save(*args, **kwargs)

    def to_base62(self):
        return base62.from_decimal(self.id)

    def short_url(self):
        return settings.SHORTER_SITE_BASE_URL + self.to_base62()

    def __unicode__(self):
        return self.to_base62() + ' : ' + self.url

class LinkSubmitForm(forms.Form):
    u = forms.URLField(label='URL to be shortened:')
