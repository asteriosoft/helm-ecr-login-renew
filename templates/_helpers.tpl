{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ecr-login-renew.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ecr-login-renew.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ecr-login-renew.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ecr-login-renew.labels" -}}
app.kubernetes.io/name: {{ include "ecr-login-renew.name" . }}
helm.sh/chart: {{ include "ecr-login-renew.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{/*
Pod labels
*/}}
{{- define "ecr-login-renew.podLabels" -}}
app.kubernetes.io/name: {{ include "ecr-login-renew.name" . }}
helm.sh/chart: {{ include "ecr-login-renew.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end -}}


{{/*
Define resource names
*/}}
{{- define "ecr-login-renew.namespace" }}
{{- default (printf "%s" .Release.Namespace) -}}
{{- end }}

{{- define "ecr-login-renew.serviceAccount" }}
{{- default (printf "%s-account" .Release.Name) -}}
{{- end }}

{{- define "ecr-login-renew.role" }}
{{- default (printf "%s-role" .Release.Name) -}}
{{- end }}

{{- define "ecr-login-renew.roleBinding" }}
{{- default (printf "%s-rolebinding" .Release.Name) -}}
{{- end }}

{{- define "ecr-login-renew.job" }}
{{- default (printf "%s-job" .Release.Name) -}}
{{- end }}

{{- define "ecr-login-renew.cronJob" }}
{{- default (printf "%s-cron" .Release.Name) -}}
{{- end }}

{{- define "ecr-login-renew.secret" }}
{{- default (printf "%s-secret" .Release.Name) -}}
{{- end }}
