from django.shortcuts import get_object_or_404, get_list_or_404
from django.http import HttpResponse, Http404, HttpResponsePermanentRedirect
from django.db import transaction
from django.conf import settings

from shorter.baseconv import base62
from shorter.models import Link, LinkSubmitForm

def follow(request, base62_id):
    """
    View which gets the link for the given base62_id value
    and redirects to it.
    """
    key = base62.to_decimal(base62_id)
    link = get_object_or_404(Link, pk = key)
    if settings.SHORTER_LOG_HITS:
        link.usage_count += 1
        link.save()
    return HttpResponsePermanentRedirect(link.url)

def submit(request):
    """
    View for submitting a URL
    """
    url = None
    link_form = None
    if request.GET:
        link_form = LinkSubmitForm(request.GET)
    elif request.POST:
        link_form = LinkSubmitForm(request.POST)
    if link_form and link_form.is_valid():
        url = link_form.cleaned_data['u']
        link = None
        try:
            link = Link.objects.get(url = url)
        except Link.DoesNotExist:
            pass
        if link == None:
            new_link = Link(url = url)
            new_link.save()
            link = new_link
        short_url_response = link.short_url()
        return HttpResponse(short_url_response, mimetype="application/json")
    failed = "There was a problem shortening this URL, please try again."
    return HttpResponse(failed, mimetype="application/json")
