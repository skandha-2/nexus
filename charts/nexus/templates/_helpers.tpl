{{- define "nexus.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "nexus.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{- define "nexus.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote }}
app.kubernetes.io/name: {{ include "nexus.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}


{{- define "nexus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nexus.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}
