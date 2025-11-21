import { PropertyModel } from "@/domain/models/property-model";
import { GetAllProperties } from "@/domain/usecases/get-all-properties";
import { HttpGetClient } from "../protocols/http/http-get-client";
import { HttpStatusCode } from "../protocols/http/http-response";

export class RemoteGetAllProperties implements GetAllProperties {

  constructor (
    private readonly url: string,
    private readonly httpGetClient: HttpGetClient<void, PropertyModel[]>
  ) {}

  async getAll(): Promise<PropertyModel[]> {
    const httpResponse = await this.httpGetClient.get({
      url: this.url
    })

    switch (httpResponse.statusCode) {
      case HttpStatusCode.ok: return httpResponse.body!
      default: throw new Error("UnexpectedError")
    }
  }
}
