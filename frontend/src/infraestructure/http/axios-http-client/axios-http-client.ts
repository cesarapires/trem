import { HttpGetClient, HttpGetParams } from '@/data/protocols/http/http-get-client'
import { HttpResponse } from '@/data/protocols/http/http-response'
import axios from 'axios'

export class AxiosHttpClient implements HttpGetClient<any, any> {
  async get (params: HttpGetParams<any>): Promise<HttpResponse<any>> {
    const httpResponse = await axios.get(params.url)
    return {
      statusCode: httpResponse.status,
      body: httpResponse.data
    }
  }
}
