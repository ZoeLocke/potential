#!/bin/bash

## Updates
git submodule update --init --recursive
hugo version

## Infrastructure
mkdir public
cp -v _redirects public/
cp -v robots.txt public/
cp -v sitemap_index.xml public/

## Core site areas
hugo -s itsalocke -d "../public"
hugo -s blog -d "../public/blog"
hugo -s talks -d "../public/talks"
hugo -s news -d "../public/news"

## Package docs
mkdir public/pRojects
cp -R pRojects/docs/* public/pRojects/

mkdir public/optiRum
cp -R optiRum/docs/* public/optiRum/

mkdir public/datasauRus
cp -R datasauRus/docs/* public/datasauRus/

mkdir public/HIBPwned
cp -R HIBPwned/docs/* public/HIBPwned/

## Reveal in root dir
mkdir public/js/revealjs
cp -R revealjs/* public/js/revealjs/

## Presentations
mkdir public/slides
cp -R pres-datascience/docs/* public/slides/
cp -R pres-r/docs/* public/slides/
cp -R pres-azure/docs/* public/slides/