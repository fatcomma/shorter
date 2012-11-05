from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    #(r'^$', 'shorter.views.index'),
    (r'^submit/$', 'shorter.views.submit'),
    (r'^(?P<base62_id>\w+)$', 'shorter.views.follow'),
    #(r'^info/(?P<base62_id>\w+)$', 'shorter.views.info'),

    # Examples:
    # url(r'^$', 'shorter.views.home', name='home'),
    # url(r'^shorter/', include('shorter.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
